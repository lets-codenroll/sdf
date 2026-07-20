import os

# Env limits (set BEFORE importing Essentia/Tensorflow)
os.environ.setdefault("OMP_NUM_THREADS", "1")
os.environ.setdefault("TF_NUM_INTRAOP_THREADS", "1")
os.environ.setdefault("TF_NUM_INTEROP_THREADS", "1")
os.environ.setdefault("TF_CPP_MIN_LOG_LEVEL", "2")  # quieter TF logs

import gc
import json
import traceback
from pathlib import Path

from mutagen.id3 import ID3, TXXX, ID3NoHeaderError

# Essentia logging controls (builds without setLevel)
import essentia

essentia.log.infoActive = False
essentia.log.warningActive = False
essentia.log.errorActive = True  # keep errors visible

from essentia.standard import (
    MonoLoader,
    RhythmExtractor2013, KeyExtractor, ReplayGain,
    TensorflowPredictEffnetDiscogs, TensorflowPredict2D, TensorflowPredictMusiCNN
)

import numpy as np  # self-test + safety checks

# Paths & constants
SESSION_DIR = Path(__file__).parent.resolve()
MUSIC_DIR   = SESSION_DIR / 'music'   # MP3s only

MODELS_DIR = Path(os.environ.get("MOODA_MODELS_DIR", Path(__file__).parent / "essentia_models"))

# שמירת אותם שמות קבועים, אבל כ-strings (ולא Path)
MOOD_MODEL_PATH       = (MODELS_DIR / 'mood_mirex/mtg_jamendo_moodtheme-discogs-effnet-1.pb').as_posix()
GENRE_MODEL_PATH      = (MODELS_DIR / 'genre/genre_discogs400-discogs-effnet-1.pb').as_posix()
EMBEDDING_MODEL_PATH  = (MODELS_DIR / 'discogs/discogs-effnet-bs64-1.pb').as_posix()
GENRE_LABELS_PATH     = (MODELS_DIR / 'genre/genre_discogs400-discogs-effnet-1.json').as_posix()
DANCE_MODEL_PATH      = (MODELS_DIR / 'classifiers/danceability/danceability-musicnn-mtt-2.pb').as_posix()
DANCE_META_PATH       = (MODELS_DIR / 'classifiers/danceability/danceability-musicnn-mtt-2.json').as_posix()


# Central window lengths (seconds)
SEG_BPM_KEY_SEC   = 60.0   # window for BPM/Key/LUFS @44.1k mono
SEG_EMB_MOOD_SEC  = 30.0   # window for embedding+moods/genre @16k mono
SEG_DANCE_SEC     = 30.0   # window for danceability @16k mono

MOODS_THRESHOLD = 0.05
TOPN_MOODS      = 5

def _check_models_exist():
    required = [GENRE_LABELS_PATH, DANCE_META_PATH]  # הוסף כאן את כל הדרושים
    missing = [str(p) for p in required if not Path(p).exists()]
    if missing:
        raise RuntimeError(
            "Missing model files:\n  - " + "\n  - ".join(missing) +
            "\nSet MOODA_MODELS_DIR or place files under that directory."
        )

def log(msg: str):
    print(msg, flush=True)

# Static data
def load_json(path: Path):
    with open(path, 'r') as f:
        return json.load(f)

try:
    GENRE_LABELS = load_json(Path(GENRE_LABELS_PATH))['classes']
except Exception as e:
    log(f"[WARN] Failed to load GENRE labels from {GENRE_LABELS_PATH}: {e}")
    GENRE_LABELS = []

try:
    _dance_meta = load_json(Path(DANCE_META_PATH))
    DANCE_CLASSES = _dance_meta.get('classes', ['danceable', 'not_danceable'])
except Exception as e:
    log(f"[WARN] Failed to load DANCEABILITY classes from {DANCE_META_PATH}: {e}")
    DANCE_CLASSES = ['danceable', 'not_danceable']

try:
    DANCEABLE_IDX = DANCE_CLASSES.index('danceable')
except ValueError:
    log("[WARN] 'danceable' class not found in DANCE_CLASSES; defaulting to index 0")
    DANCEABLE_IDX = 0

IGNORE_GENRES = [
    "Electronic---Experimental", "Electronic---Industrial", "Folk, World, & Country---Volksmusik",
    "Children's---Story", "Non-Music---Radioplay", "Folk, World, & Country---Catalan Music",
    "Non-Music---Spoken Word", "Stage & Screen---Soundtrack", "Latin---Cumbia",
    "Children's---Educational", "Brass & Military---Brass Band", "Stage & Screen---Theme"
]

MOOD_LABELS = [
    "action", "adventure", "background", "ballad", "calm",
    "children", "christmas", "cool", "corporate", "dark",
    "deep", "drama", "dramatic", "dream", "emotional",
    "energetic", "epic", "fast", "fun", "funny", "groovy",
    "happy", "heavy", "holiday", "hopeful", "inspiring", "love",
    "meditative", "melancholic", "melodic", "motivational",
    "nature", "party", "positive", "powerful", "relaxing", "retro",
    "romantic", "sad", "sexy", "slow", "soft", "soundscape", "space",
    "sport", "summer", "travel", "upbeat", "uplifting"
]

# =========================
# Global models (load once)
# =========================
EFFNET = None
MOOD_PRED = None
GENRE_PRED = None
DANCE_PRED = None

def init_models():
    _check_models_exist()
    global EFFNET, MOOD_PRED, GENRE_PRED, DANCE_PRED
    if EFFNET is None:
        log("[INIT] Loading Effnet embedding model...")
        EFFNET = TensorflowPredictEffnetDiscogs(
            graphFilename=EMBEDDING_MODEL_PATH,
            output='PartitionedCall:1'
        )
        log("[OK] Effnet loaded.")
    if MOOD_PRED is None:
        log("[INIT] Loading Mood predictor...")
        MOOD_PRED = TensorflowPredict2D(
            graphFilename=MOOD_MODEL_PATH,
            input='model/Placeholder',
            output='model/Sigmoid'
        )
        log("[OK] Mood predictor loaded.")
    if GENRE_PRED is None:
        log("[INIT] Loading Genre predictor...")
        GENRE_PRED = TensorflowPredict2D(
            graphFilename=GENRE_MODEL_PATH,
            input='serving_default_model_Placeholder',
            output='PartitionedCall'
        )
        log("[OK] Genre predictor loaded.")
    if DANCE_PRED is None:
        log("[INIT] Loading Danceability predictor (MusiCNN)...")
        DANCE_PRED = TensorflowPredictMusiCNN(
            graphFilename= DANCE_MODEL_PATH
        )
        log("[OK] Danceability predictor loaded.")

    # ---- One-time self-test (robust; avoids LIST_EMPTY) ----
    try:
        log("[SELFTEST] Running a short inference sanity check...")
        dur_sec = 30  # long enough for frame-based models
        x16 = np.zeros(int(16000 * dur_sec), dtype=np.float32)  # 30s @16k mono (silence)

        # Effnet embedding
        emb = EFFNET(x16)

        # Check embedding is non-empty
        emb_arr = np.asarray(emb)
        if emb_arr.size == 0 or (emb_arr.ndim >= 1 and emb_arr.shape[0] == 0):
            log("[SELFTEST] Effnet returned empty embedding on dummy audio; "
                "skipping MOOD/GENRE self-check (this can happen with silent inputs).")
        else:
            _ = MOOD_PRED(emb)
            _ = GENRE_PRED(emb)

        # Danceability on same dummy audio (should run even on silence)
        _ = DANCE_PRED(x16)
        log("[SELFTEST] Passed (models load & basic inference OK) ✓")
    except Exception as e:
        log(f"[SELFTEST-FAIL] Model inference failed: {e}")
        raise

# =========================
# Center-window loader (MonoLoader + slicing)
# =========================
def load_center_window(path: Path, target_sr: int, dur_sec: float):
    """
    Load FULL file as mono at 'target_sr' using MonoLoader (robust across builds),
    then slice a centered window of 'dur_sec' seconds. Returns 1-D float vector.
    """
    log(f"[LOAD] MonoLoader '{path.name}' at {target_sr} Hz (full file)...")
    audio = MonoLoader(filename=str(path), sampleRate=int(target_sr))()
    n = len(audio)
    if n == 0:
        raise RuntimeError("Loaded empty audio (len=0). Check file/codec.")
    total_sec = n / float(target_sr)
    log(f"[LOAD] '{path.name}' length: {total_sec:.2f}s ({n} samples)")

    if total_sec <= dur_sec:
        log(f"[LOAD] Using entire signal (shorter than requested {dur_sec}s).")
        return audio

    win = int(dur_sec * target_sr)
    start = (n - win) // 2
    end   = start + win
    log(f"[SLICE] '{path.name}' center window: start={start} end={end} ({dur_sec:.2f}s)")
    return audio[start:end]

# =========================
# Feature extractors
# =========================
def compute_bpm_key_lufs(path: Path):
    """Compute BPM, root key & LUFS on a 60s middle window @44.1k mono."""
    audio44 = load_center_window(path, target_sr=44100, dur_sec=SEG_BPM_KEY_SEC)
    log(f"[BPM/KEY] RhythmExtractor2013 + KeyExtractor on '{path.name}'...")
    bpm, *_ = RhythmExtractor2013(method='multifeature')(audio44)
    key, scale, _ = KeyExtractor()(audio44)
    root_key = f"{key} {scale}"
    lufs = ReplayGain()(audio44)
    log(f"[BPM/KEY] '{path.name}': BPM={bpm:.2f}, ROOT_KEY={root_key}, LUFS≈{lufs:.2f}")
    del audio44
    gc.collect()
    return round(bpm, 2), root_key, round(lufs, 2)

def transform_genre(label: str) -> str:
    if label.startswith('Electronic---'):
        return label.split('---', 1)[1]
    if label.startswith('Folk, World, & Country---'):
        return label.split('---', 1)[1]
    return label.replace('---', ', ')

def compute_embedding_moods_genre(path: Path, is_electronic: bool):
    """Compute Effnet embedding (16k/30s), mood scores dict, and top genre string."""
    audio16 = load_center_window(path, target_sr=16000, dur_sec=SEG_EMB_MOOD_SEC)

    log(f"[EMB] Effnet embedding for '{path.name}'...")
    embedding = EFFNET(audio16)

    # Robustness: ensure non-empty embedding
    emb_arr = np.asarray(embedding)
    if emb_arr.size == 0 or (emb_arr.ndim >= 1 and emb_arr.shape[0] == 0):
        raise RuntimeError(
            "Empty embedding from Effnet. Increase SEG_EMB_MOOD_SEC (e.g., to 40–60s) "
            "or ensure the audio16 length is sufficient."
        )

    log(f"[MOOD] Predicting moods for '{path.name}'...")
    mood_pred = MOOD_PRED(embedding).flatten()
    mood_scores = {lbl: float(sc) for lbl, sc in zip(MOOD_LABELS, mood_pred)}

    moods_threshold = sorted(
        ((lbl.capitalize(), sc) for lbl, sc in mood_scores.items() if sc > MOODS_THRESHOLD),
        key=lambda x: -x[1]
    )
    if moods_threshold:
        log(f"[MOOD] Top {TOPN_MOODS} (>{MOODS_THRESHOLD}): " +
            ", ".join([f"{lbl}:{sc:.3f}" for lbl, sc in moods_threshold[:TOPN_MOODS]]))
    else:
        log(f"[MOOD] No moods above threshold {MOODS_THRESHOLD}.")

    log(f"[GENRE] Predicting genres for '{path.name}'...")
    genre_pred = GENRE_PRED(embedding).flatten()
    genres_sorted = sorted(zip(GENRE_LABELS, genre_pred), key=lambda x: -x[1]) if GENRE_LABELS else []

    # ---- electronic filter logic ----
    if is_electronic:
        # keep only electronic
        filtered = [(g, p) for g, p in genres_sorted if g.startswith("Electronic---")]
    else:
        # [CHANGED] when not electronic-mode, allow ALL genres (electronic and non)  # [CHANGED]
        filtered = [(g, p) for g, p in genres_sorted]  # [CHANGED]

    filtered = [(g, p) for g, p in filtered if g not in IGNORE_GENRES]

    # previous single-genre selection kept, but we will now export TOP-3  # [CHANGED]
    if filtered:
        candidates = filtered
        log(f"[GENRE] '{path.name}' top-5 candidates: " + ", ".join([g for g, _ in candidates[:5]]))
    else:
        candidates = genres_sorted
        if candidates:
            log(f"[GENRE] No filtered candidates; falling back to unfiltered top list")
        else:
            log(f"[GENRE] No candidates at all; setting Unknown")

    # Build up to 3 genres, comma-separated (like MOODS)  # [CHANGED]
    top_labels = [g for g, _ in candidates[:3]] if candidates else ["Unknown"]  # [CHANGED]
    genres_str = ", ".join(transform_genre(lbl) for lbl in top_labels)          # [CHANGED]

    del audio16, embedding, mood_pred, genre_pred
    gc.collect()

    return ", ".join(lbl for lbl, _ in moods_threshold), mood_scores, genres_str  # [CHANGED] (genres_str now may contain up to 3)
    # NOTE: function signature and return count remain identical. Only 'genres_str' content changed.  # [CHANGED]

def compute_danceability(path: Path) -> float:
    """Compute danceability % (0–100) on a 30s center window @16k using MusiCNN."""
    audio16 = load_center_window(path, target_sr=16000, dur_sec=SEG_DANCE_SEC)
    log(f"[DANCE] Predicting danceability for '{path.name}'...")
    acts = DANCE_PRED(audio16)  # [time_patches, num_classes]
    prob = float(acts.mean(axis=0)[DANCEABLE_IDX])
    score_pct = round(prob * 100.0, 1)
    log(f"[DANCE] '{path.name}' DANCEABLE_SCORE={score_pct:.1f}")
    del audio16, acts
    gc.collect()
    return score_pct

# =========================
# Metadata writer (MP3 only)
# =========================
def write_id3(path: Path, bpm, root_key, moods, genre, lufs, mood_scores, danceable_score_pct):
    log(f"[META] Writing ID3 tags to '{path.name}'...")
    try:
        try:
            tags = ID3(path)
        except ID3NoHeaderError:
            tags = ID3()
        fields = [
            ('BPM', bpm),
            ('ROOT_KEY', root_key),
            ('MOODS', moods),
            ('GENRE', genre),  # may contain up to 3 genres, comma-separated  # [CHANGED]
            ('LUFS', lufs),
            ('DANCEABLE_SCORE', danceable_score_pct)
        ]
        for desc, val in fields:
            tags.setall(f"TXXX:{desc}", [TXXX(encoding=3, desc=desc, text=str(val))])
        for mood_name, score in mood_scores.items():
            desc = f"MOOD_{mood_name.upper()}"
            tags.setall(f"TXXX:{desc}", [TXXX(encoding=3, desc=desc, text=f"{score:.3f}")])
        tags.save(path)
        log(f"[META] ID3 written OK for '{path.name}'.")
    except Exception as e:
        log(f"[META-ERR] ID3 write failed for '{path.name}': {e}")
        raise

# =========================
# Orchestration
# =========================
def process_file(src: Path, is_electronic: bool):
    log(f"\n=== Processing '{src.name}' ===")
    try:
        bpm, root_key, lufs = compute_bpm_key_lufs(src)
        moods_str, mood_scores, genre_str = compute_embedding_moods_genre(src, is_electronic)
        danceable = compute_danceability(src)
        write_id3(src, bpm, root_key, moods_str, genre_str, lufs, mood_scores, danceable)
        log(f"[DONE] '{src.name}' processed successfully.")
    except Exception as e:
        log(f"[ERROR] Failed processing '{src.name}': {e}")
        log("[TRACEBACK]\n" + traceback.format_exc())

def process_all(is_electronic: bool):
    init_models()
    files = [p for p in MUSIC_DIR.glob('*.mp3')]
    if not files:
        log(f"[INFO] No MP3 files found in {MUSIC_DIR}")
        return
    log(f"[INFO] Found {len(files)} MP3 files in {MUSIC_DIR}")
    for src in files:
        process_file(src, is_electronic)
        gc.collect()

# =========================
# CLI
# =========================
if __name__ == '__main__':
    try:
        # Updated prompt semantics: 
        # y = electronic-only; n = ALL genres (electronic + non-electronic)  # [CHANGED]
        ans = input("Is this electronic music? (y = electronic-only / n = all genres): ").strip().lower()  # [CHANGED]
        is_elec = (ans == 'y')  # 'n' (or anything else) will mean ALL genres  # [CHANGED]
        process_all(is_elec)
        log("\n[ALL DONE] Processing completed.")
    except KeyboardInterrupt:
        log("\n[INTERRUPTED] Aborted by user.")
    except Exception as e:
        log(f"\n[FATAL] Unhandled exception: {e}")
        log("[TRACEBACK]\n" + traceback.format_exc())
