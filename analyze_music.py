import subprocess
import shutil
from pathlib import Path
from mutagen.id3 import ID3, TXXX, ID3NoHeaderError
from mutagen.flac import FLAC
from mutagen.wave import WAVE
from essentia.standard import (
    MonoLoader, RhythmExtractor2013, KeyExtractor, ReplayGain,
    TensorflowPredictEffnetDiscogs, TensorflowPredict2D, RMS
)
import json

# Working directories
SESSION_DIR = Path(__file__).parent.resolve()
MUSIC_DIR   = SESSION_DIR / 'music'
TEMP_DIR    = SESSION_DIR / 'temp'

# Prediction models
MOOD_MODEL_PATH      = 'essentia_models/mood_mirex/mtg_jamendo_moodtheme-discogs-effnet-1.pb'
GENRE_MODEL_PATH     = 'essentia_models/genre/genre_discogs400-discogs-effnet-1.pb'
EMBEDDING_MODEL_PATH = 'essentia_models/discogs/discogs-effnet-bs64-1.pb'
GENRE_LABELS_PATH    = 'essentia_models/genre/genre_discogs400-discogs-effnet-1.json'

# Load genre labels
with open(GENRE_LABELS_PATH, 'r') as f:
    GENRE_LABELS = json.load(f)['classes']

# Ignored genres
IGNORE_GENRES = [
    "Electronic---Experimental", "Electronic---Industrial", "Folk, World, & Country---Volksmusik",
    "Children's---Story", "Non-Music---Radioplay", "Folk, World, & Country---Catalan Music",
    "Non-Music---Spoken Word", "Stage & Screen---Soundtrack", "Latin---Cumbia",
    "Children's---Educational", "Brass & Military---Brass Band", "Stage & Screen---Theme"
]

# Allowed mood labels
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

# Prepare the temp irectory
def prepare_temp_directory():
    if TEMP_DIR.exists():
        shutil.rmtree(TEMP_DIR)
    TEMP_DIR.mkdir(parents=True)
    for src in MUSIC_DIR.glob('*'):
        if src.suffix.lower() in ('.mp3', '.flac', '.wav'):
            shutil.copy2(src, TEMP_DIR / src.name)

# Convert to wav file
def convert_to_wav(filepath: Path, sample_rate: float) -> Path:
    wav_path = filepath.with_suffix(f'.temp_{int(sample_rate)}.wav')
    subprocess.run([
        'ffmpeg', '-y', '-i', str(filepath),
        '-ac', '1', '-ar', str(sample_rate), str(wav_path)
    ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    return wav_path

# Transform genre labels
def transform_genre(label: str) -> str:
    if label.startswith('Electronic---'):
        return label.split('---', 1)[1]
    if label.startswith('Folk, World, & Country---'):
        return label.split('---', 1)[1]
    return label.replace('---', ', ')

# Extract feature
def extract_features(filepath: Path, is_electronic: bool):

    # create two WAVs: 44.1 kHz for BPM/Key, 16 kHz for embedding
    wav44 = convert_to_wav(filepath, sample_rate=44100)
    wav16 = convert_to_wav(filepath, sample_rate=16000)

    # load for BPM & Key
    audio44 = MonoLoader(filename=str(wav44), sampleRate=44100)()
    bpm, *_ = RhythmExtractor2013(method='multifeature')(audio44)
    key, scale, _ = KeyExtractor()(audio44)
    root_key = f"{key} {scale}"

    # load for embedding/mood/genre
    gain = ReplayGain()(audio44)
    lufs = gain

    # embedding
    audio16 = MonoLoader(filename=str(wav16), sampleRate=16000)()
    embedder = TensorflowPredictEffnetDiscogs(
        graphFilename=EMBEDDING_MODEL_PATH,
        output='PartitionedCall:1'
    )
    embedding = embedder(audio16)

    # mood prediction and threshold
    mood_pred = TensorflowPredict2D(
        graphFilename=MOOD_MODEL_PATH,
        input='model/Placeholder',
        output='model/Sigmoid'
    )(embedding).flatten()
    moods = sorted(
        ((lbl.capitalize(), sc) for lbl, sc in zip(MOOD_LABELS, mood_pred) if sc > 0.1),
        key=lambda x: -x[1]
    )
    moods_str = ", ".join(lbl for lbl, _ in moods)

    # genre prediction, take top 1 and transform
    genre_pred = TensorflowPredict2D(
        graphFilename=GENRE_MODEL_PATH,
        input='serving_default_model_Placeholder',
        output='PartitionedCall'
    )(embedding).flatten()

    genres_sorted = sorted(zip(GENRE_LABELS, genre_pred), key=lambda x: -x[1])

    if is_electronic:
        filtered = [(g, p) for g, p in genres_sorted if g.startswith("Electronic---")]
    else:
        filtered = [(g, p) for g, p in genres_sorted if not g.startswith("Electronic---")]

    filtered = [(g, p) for g, p in filtered if g not in IGNORE_GENRES]

    raw_genre = filtered[0][0] if filtered else genres_sorted[0][0]
    genre_str = transform_genre(raw_genre)

    # debug print top 5
    top5 = [g for g, _ in filtered[:5]]
    print(f"Top 5 genres for {filepath.name}: {', '.join(top5)}")

    return (
        round(bpm, 2),
        root_key,
        moods_str,
        genre_str,
        round(lufs, 2),
        round(gain, 2)
    )

def write_metadata(path: Path, bpm, root_key, moods, genre, lufs, gain):
    suffix = path.suffix.lower()
    if suffix == '.mp3':
        try:
            tags = ID3(path)
        except ID3NoHeaderError:
            tags = ID3()
        for desc, val in [
            ('BPM', bpm), ('ROOT_KEY', root_key), ('MOODS', moods),
            ('GENRE', genre), ('LUFS', lufs), ('LUFS_GAIN', gain)
        ]:
            tags.setall(f"TXXX:{desc}", [TXXX(encoding=3, desc=desc, text=str(val))])
        tags.save(path)
    elif suffix == '.flac':
        audio = FLAC(path)
        audio['BPM']       = str(bpm)
        audio['ROOT_KEY']  = root_key
        audio['MOODS']     = moods
        audio['GENRE']     = genre
        audio['LUFS']      = str(lufs)
        audio['LUFS_GAIN'] = str(gain)
        audio.save()
    elif suffix == '.wav':
        audio = WAVE(path)
        info = audio.tags or {}
        info.update({
            'BPM': str(bpm), 'ROOT_KEY': root_key,
            'MOODS': moods, 'GENRE': genre,
            'LUFS': str(lufs), 'LUFS_GAIN': str(gain)
        })
        audio.tags = info
        audio.save()

def process_all(is_electronic: bool):
    prepare_temp_directory()
    for src in TEMP_DIR.glob('*'):
        if src.suffix.lower() not in ('.mp3', '.flac', '.wav'):
            continue
        data = extract_features(src, is_electronic)
        write_metadata(MUSIC_DIR / src.name, *data)

    for child in TEMP_DIR.iterdir():
        if child.is_dir():
            shutil.rmtree(child)
        else:
            child.unlink(missing_ok=True)

if __name__ == '__main__':
    ans = input("Is this electronic music? (y/n): ").strip().lower()
    is_elec = (ans == 'y')
    process_all(is_elec)
