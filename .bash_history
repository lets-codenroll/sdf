cd music/
ls -l
eyeD3 --frames=TXXX "אביתר בנאי - יפה כלבנה.mp3"
cd ..
python3 energy.py energy
python3 analyze_music.py 
python3 analyze_music.py
git init
git status
git add .
git commit -m"working process with discog models"
git branch -M main
git remote add origin https://github.com/lets-codenroll/music-feature-extract.git
git push -u origin main
git config --global user.name "lets-codenroll"
git config --global user.email "a@codenroll.co.il"
git push -u origin main
git status
git add .
git commit -m "working process with discog models"
git branch -M main
git remote add origin https://github.com/lets-codenroll/music-feature-extract.git
git push -u origin main
git remote set-url origin git@github.com:lets-codenroll/music-feature-extract.git
ssh -T git@github.com
ssh-keygen -t ed25519 -C "a@codenroll.co.il"
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com
git push -u origin main
python3 analyze_music.py 
git status
git add .
git commit -m "moving to 16khz"
git pushA
python3 analyze_music.py
git status
git add .
git commit -m "moving back to discog genres with working 16khz"
git push
python3 analyze_music.py
df -h
python3 analyze_music.py
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip ffmpeg libsndfile1
pip install essentia-tensorflow
python3 --version
mkdir -p ~/essentia_models
cd essentia_models
wget https://essentia.upf.edu/models/discogs-effnet/genre-discogs-effnet-1.pb
ls -l
mkir discogs
mkdir discogs
cd discogs
wget https://essentia.upf.edu/models/feature-extractors/discogs-effnet/discogs-effnet-bs64-1.pb
wget https://essentia.upf.edu/models/feature-extractors/discogs-effnet/discogs-effnet-bs64-1.json
cd ..
mkdir mood_mirex
cd mood_mirex/
wget https://essentia.upf.edu/models/classification-heads/mtg_jamendo_moodtheme/mood_mirex-discogs-effnet-1.pb
wget https://essentia.upf.edu/models/feature-extractors/discogs-effnet/discogs-effnet-bs64-1.pb
wget https://essentia.upf.edu/models/feature-extractors/discogs-effnet/discogs-effnet-bs64-1.json
ls -l
rm -rf ./*
wget https://essentia.upf.edu/models/classification-heads/mtg_jamendo_moodtheme-discogs-effnet/mtg_jamendo_moodtheme-discogs-effnet-1.pb
wget https://essentia.upf.edu/models/context-mood/moods-mirex-discogs-effnet-1.pb
wget https://essentia.upf.edu/models/classification-heads/moods-mirex-discogs-effnet-1.pb
cd ..
python3 test.
python3 test.py 
pip install "numpy<2.0"
python3 test.py 
cd essentia_models/
mkdir genre
cd genre
wget https://essentia.upf.edu/models/classification-heads/genre-discogs/genre_discogs-effnet-1.pb
cd ..
python3 test2.py 
python3 test3.py 
python3 test4.py 
python3 analyze_music.py 
pip install pydub
python3 analyze_music.py 
pip install mutagen
python3 analyze_music.py 
cd music/
python3 prepare_audio.py 
pup install ffmpeg
pip install ffmpeg
python3 prepare_audio.py 
pip install librosa
python3 prepare_audio.py 
pip install eyed3
python3 prepare_audio.py 
pip install pyloudnorm
python3 prepare_audio.py 
cd ..
python3 analyze_music.py 
python3 energy.py energy
python3 analyze_music.py 
git status
python3 analyze_music.py 
git status
git add .
git commit -m "last working version before fadein&fadeout"
git pus
python3 fade_only.py 
python3 fade_only.py music
python3 fade_only.py
python3 analyze_music.py 
python3 fade_only.py
pip install madmom
python3 fade_only.py
pip install Cython
pip install madmom
python3 fade_only.py
python --version
python -v
python3 -v
python3 --version
nano /usr/local/lib/python3.10/dist-packages/madmom/processors.py
python3 fade_only.py
pip install numpy==1.23.5
python3 fade_only.py
pip install omnizart
omnizart download-checkpoints drums
pip install omnizart
omnizart download-checkpoints drums
python3 analyze_music.py 
python3 analyze_music.py \
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
A
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
python3 version1.py 
python3 analyze_music.py
git status
git add .
git commit -m "before danceability"
git push
python3 analyze_music.py
git status
git add .
git commit -m "before multiple genres"
git push
python3 analyze_music.py
df -h
python3 analyze_music.py
pip install mutagen boto3
echo 'export SPACES_ENDPOINT="https://mooda-music.sfo3.digitaloceanspaces.com"' >> ~/.bashrc
echo 'export SPACES_BUCKET="mooda-music"' >> ~/.bashrc
echo 'export SPACES_KEY="allbuckets-1760358549070"' >> ~/.bashrc
echo 'export SPACES_SECRET="U2vOUixEDcj9zlJCrzmrbWyYw3V++5mW0l2Ty37waQc"' >> ~/.bashrc
source ~/.bashrc
cd albums/Blue/
python3 ../manifest_builder.py --title "Blue" --artist "Joni Mitchell" --year 1971 --upload-yes
cd ..
python3 albums/manifest_builder.py --title "Blue" --artist "Joni Mitchell" --year 1971 --upload-yes
cd albums/Blue/
python3 ../manifest_builder.py   --title "Blue"   --artist "Joni Mitchell"   --year 1971   --yes   --upload-yes
ln -s /root/essentia_models essentia_models
python3 ../manifest_builder.py --title "Blue" --artist "Joni Mitchell" --year 1971 --upload-yes
ls -l
dmesg -T | tail -n 30
free -h
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
free -h
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
python3 ../manifest_builder.py --title "Blue" --artist "Joni Mitchell" --year 1971 --upload-yes --canonical-variant "mp3@192"
python3 ../manifest_builder.py --title "Blue" --artist "Joni Mitchell" --year 1971 --upload-yes
ls -l
cd /root/albums/Blue
python3 ../manifest_builder.py   --title "Blue"   --artist "Joni Mitchell"   --year 1971   --upload-yes
export SPACES_ENDPOINT="https://mooda-music.sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
ls -l essentia_models
test -L essentia_models && rm essentia_models
ls -la /root/essentia_models
echo 'export MOODA_MODELS_DIR="/root/essentia_models"' >> ~/.bashrc
source ~/.bashrc
echo "$MOODA_MODELS_DIR"
ls -la "$MOODA_MODELS_DIR"
python3 ../manifest_builder.py   --title "Blue"   --artist "Joni Mitchell"   --year 1971   --upload-yes
echo SPACES_ENDPOINT;
print SPACES_ENDPOINT;
echo "$SPACES_ENDPOINT"
echo "$SPACES_BUCKET" 
python3 ../manifest_builder.py   --title "Blue" --artist "Joni Mitchell" --year 1971   --upload-yes --upload-dry-run
unset SPACES_ENDPOINT
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
echo "$SPACES_ENDPOINT" 
python3 ../manifest_builder.py   --title "Blue" --artist "Joni Mitchell" --year 1971   --upload-yes --upload-dry-run   --spaces-endpoint "https://sfo3.digitaloceanspaces.com"   --spaces-bucket "mooda-music"
python3 ../manifest_builder.py   --title "Blue" --artist "Joni Mitchell" --year 1971   --upload-yes   --spaces-endpoint "https://sfo3.digitaloceanspaces.com"   --spaces-bucket "mooda-music"
echo "$SPACES_KEY"
echo "$SPACES_SECRET"
export SPACES_KEY=allbuckets-1760358549070
export SPACES_SECRET=U2vOUixEDcj9zlJCrzmrbWyYw3V++5mW0l2Ty37waQc
python3 - << 'PY'
import os
for k in ["SPACES_ENDPOINT","SPACES_BUCKET","SPACES_KEY","SPACES_SECRET"]:
    v=os.environ.get(k,"")
    print(k, len(v), repr(v[:4]+"…"+v[-4:] if len(v)>8 else v))
PY

unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION
python3 - << 'PY'
import os, boto3
from botocore.config import Config as BotoConfig
endpoint=os.environ["SPACES_ENDPOINT"]
bucket=os.environ["SPACES_BUCKET"]
key=os.environ["SPACES_KEY"]
secret=os.environ["SPACES_SECRET"]
s3=boto3.client("s3",
    endpoint_url=endpoint,
    aws_access_key_id=key,
    aws_secret_access_key=secret,
    region_name="sfo3",
    config=BotoConfig(s3={"addressing_style":"virtual"}))
# 1) בדיקת חיבור כללית
print("list_buckets ->", [b["Name"] for b in s3.list_buckets().get("Buckets",[])])
# 2) בדיקת הרשאות לבאקט
s3.head_bucket(Bucket=bucket)
print("head_bucket OK for", bucket)
PY

export SPACES_KEY="$(printf %s "$SPACES_KEY" | tr -d '\r' | xargs)"
export SPACES_SECRET="$(printf %s "$SPACES_SECRET" | tr -d '\r' | xargs)"
python3 - << 'PY'
import os
for k in ["SPACES_ENDPOINT","SPACES_BUCKET","SPACES_KEY","SPACES_SECRET"]:
    v=os.environ.get(k,"")
    print(k, len(v), repr(v))
PY

export SPACES_SECRET="DO00BKLRJ4JVVK2M2LRL"
python3 - << 'PY'
import os
for k in ["SPACES_ENDPOINT","SPACES_BUCKET","SPACES_KEY","SPACES_SECRET"]:
    v=os.environ.get(k,"")
    print(k, len(v), repr(v))
PY

python3 ../manifest_builder.py   --title "Blue" --artist "Joni Mitchell" --year 1971   --upload-yes   --spaces-endpoint "https://sfo3.digitaloceanspaces.com"   --spaces-bucket "mooda-music"
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
export SPACES_KEY="allbuckets-1760358549070"
export SPACES_SECRET="DO00BKLRJ4JVVK2M2LRL"
export SPACES_KEY="$(printf %s "$SPACES_KEY" | tr -d '\r' | xargs)"
export SPACES_SECRET="$(printf %s "$SPACES_SECRET" | tr -d '\r' | xargs)"
python3 - << 'PY'
import os
for k in ["SPACES_ENDPOINT","SPACES_BUCKET","SPACES_KEY","SPACES_SECRET"]:
    v=os.environ.get(k,"")
    print(k, len(v), repr(v))
PY

python3 - << 'PY'
import os, boto3
from botocore.client import Config
s3=boto3.client("s3",
    endpoint_url=os.environ["SPACES_ENDPOINT"],
    aws_access_key_id=os.environ["SPACES_KEY"],
    aws_secret_access_key=os.environ["SPACES_SECRET"],
    region_name="sfo3",
    config=Config(signature_version="s3v4", s3={"addressing_style":"virtual"}))
s3.head_bucket(Bucket=os.environ["SPACES_BUCKET"])
print("head_bucket OK for", os.environ["SPACES_BUCKET"])
PY

export SPACES_SECRET="6iH5vkMAI1wlWAxRB286lGUIYgaOfBgJm6ZFg1Ft6LE"
export SPACES_KEY="DO00UPNNNGN4V9WTLG4W"
export SPACES_KEY="$(printf %s "$SPACES_KEY" | tr -d '\r' | xargs)"
export SPACES_SECRET="$(printf %s "$SPACES_SECRET" | tr -d '\r' | xargs)"
python3 - << 'PY'
import os, boto3
from botocore.client import Config
s3=boto3.client("s3",
    endpoint_url=os.environ["SPACES_ENDPOINT"],
    aws_access_key_id=os.environ["SPACES_KEY"],
    aws_secret_access_key=os.environ["SPACES_SECRET"],
    region_name="sfo3",
    config=Config(signature_version="s3v4", s3={"addressing_style":"virtual"}))
s3.head_bucket(Bucket=os.environ["SPACES_BUCKET"])
print("head_bucket OK for", os.environ["SPACES_BUCKET"])
PY

python3 ../manifest_builder.py   --title "Blue" --artist "Joni Mitchell" --year 1971   --spaces-endpoint "https://sfo3.digitaloceanspaces.com"   --spaces-bucket "mooda-music"   --upload-yes
python3 ../manifest_builder.py   --title "Blue" --artist "Joni Mitchell" --year 1971   --upload-yes --upload-dry-run
python3 ../manifest_builder.py --title "Sunlight" --artist "Herbie Hancock" --year 1977 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
ls -l
cd Sunlight/
python3 ../manifest_builder.py --title "Sunlight" --artist "Herbie Hancock" --year 1977 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
python3 ../manifest_builder.py --title "Coco" --artist "Colbie Caillat" --year 2007 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
cd This\ Time\ Around/
python3 ../manifest_builder.py --title "Will You Count Me In" --artist "Colbie Caillat" --year 2023 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
cd /root/
ls -l
cd albums/
cd Will\ You\ Count\ Me\ In/
cd ..
cd Along\ The\ Way/
python3 ../manifest_builder.py --title "Along the Way" --artist "Colbie Caillat" --year 2023 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
cd /root/albums/
cd Will\ You\ Count\ Me\ In/
python3 ../manifest_builder.py --title "Will You Count Me In" --artist "Colbie Caillat" --year 2023 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
cd Gypsy\ Heart/
python3 ../manifest_builder.py --title "Gypsy Heart" --artist "Colbie Caillat" --year 2014 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
cd Christmas\ in\ the\ Sand/
python3 ../manifest_builder.py --title "Christmas in the Sand" --artist "Colbie Caillat" --year 2012 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
cd albums/All\ Of\ You/
python3 ../manifest_builder.py --title "All Of You" --artist "Colbie Caillat" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
cd Breakthrough/
python3 ../manifest_builder.py --title "Breakthrough" --artist "Colbie Caillat" --year 2009 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Breakthrough/
cd iTunes\ Live/
python3 ../manifest_builder.py --title "iTunes Live" --artist "Colbie Caillat" --year 2012 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf 30/
cd For\ Emma\,\ Forever\ Ago/
python3 ../manifest_builder.py --title "For Emma, Forever Ago" --artist "Bon Iver" --year 2007 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf For\ Emma\,\ Forever\ Ago/
cd Bigger\,\ Better\,\ Faster\,\ More\!/
python3 ../manifest_builder.py --title "Bigger, Better, Faster, More!" --artist "4 Non Blondes" --year 1992 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Bigger\,\ Better\,\ Faster\,\ More\!/
cd Aerosmith/
python3 ../manifest_builder.py --title "Aerosmith" --artist "Aerosmith" --year 1973 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
בג ץץ
cd ..
rm -rf Aerosmith/
ls -l
cd Get\ Your\ Wings/
python3 ../manifest_builder.py --title "Get Your Wings" --artist "Aerosmith" --year 1974 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Get\ Your\ Wings/
cd i,i/
python3 ../manifest_builder.py --title "i,i" --artist "Bon Iver" --year 2019 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf i,i/
cd Draw\ The\ Line/
python3 ../manifest_builder.py --title "Draw The Line" --artist "Aerosmith" --year 1977 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Draw\ The\ Line/
cd Libertango/
python3 ../manifest_builder.py --title "Libertango" --artist "Astor Piazzolla" --year 1974 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Libertango/
ls -l
cd 'Rock In A Hard Place'/
ls -l
python3 ../manifest_builder.py --title "Rock In A Hard Place" --artist "Aerosmith" --year 1982 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf 'Rock In A Hard Place'/
cd Rocks/
python3 ../manifest_builder.py --title "Rocks" --artist "Aerosmith" --year 1976 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Rocks/
cd Toys\ In\ The\ Attic/
python3 ../manifest_builder.py --title "Toys In The Attic" --artist "Aerosmith" --year 1975 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Toys\ In\ The\ Attic/
cd Night\ In\ The\ Ruts/
python3 ../manifest_builder.py --title "Night In The Ruts" --artist "Aerosmith" --year 1979 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Night\ In\ The\ Ruts/
cd One\ in\ a\ Million/
python3 ../manifest_builder.py --title "One in a Million" --artist "Aaliyah" --year 1996 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf One\ in\ a\ Million/
cd Done\ With\ Mirrors/
python3 ../manifest_builder.py --title "Done With Mirrors" --artist "Aerosmith" --year 1985 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
בג ץץ
cd ..
rm -rf Done\ With\ Mirrors/
cd Nine\ Lives/
python3 ../manifest_builder.py --title "Nine Lives" --artist "Aerosmith" --year 1997 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Nine\ Lives/
cd Permanent\ Vacation/
python3 ../manifest_builder.py --title "Permanent Vacation" --artist "Aerosmith" --year 1987 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Permanent\ Vacation/
cd Get\ A\ Rip/
python3 ../manifest_builder.py --title "Get A Rip" --artist "Aerosmith" --year 1993 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Get\ A\ Rip/
cd Honkin\'\ on\ Bobo/
python3 ../manifest_builder.py --title "Honkin' on Bobo" --artist "Aerosmith" --year 2004 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Honkin\'\ on\ Bobo/
cd Empty\ Sky/
python3 ../manifest_builder.py --title "Empty Sky" --artist "Elton John" --year 1969 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Empty\ Sky/
cd Ice\ On\ Fire/
python3 ../manifest_builder.py --title "Ice On Fire" --artist "Elton John" --year 1985 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Ice\ On\ Fire/
ls -l
cd Boys\ \&\ Girls/
python3 ../manifest_builder.py --title "Boys & Girls" --artist "Alabama Shakes" --year 2012 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Boys\ \&\ Girls/
cd Sound\ \&\ Color/
python3 ../manifest_builder.py --title "Sound & Color" --artist "Alabama Shakes" --year 2015 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Sound\ \&\ Color/
ls -l
cd Just\ Push\ Play/
python3 ../manifest_builder.py --title "Just Push Play" --artist "Aerosmith" --year 2001 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Just\ Push\ Play/
cd Mr.\ A-Z/
python3 ../manifest_builder.py --title "Mr. A-Z" --artist "Json Mraz" --year 2005 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Mr.\ A-Z/
cd Aerosmith\ -\ Music\ From\ Another\ Dimension\!/
python3 ../manifest_builder.py --title "Music From Another Dimension!" --artist "Aerosmith" --year 2012 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music"   --upload-yes
cd ..
rm -rf Aerosmith\ -\ Music\ From\ Another\ Dimension\!/
unzip Derek\ Trucks\ Band\ -\ Joyful\ Noise\ \(2002\).zip -d ./
apt install unzip
unzip Derek\ Trucks\ Band\ -\ Joyful\ Noise\ \(2002\).zip -d ./
cd Derek\ Trucks\ Band\ -\ Joyful\ Noise\ \(2002\)/
python3 ../manifest_builder.py --title "Derek Trucks Band" --artist "Derek Trucks Band" --year 2002 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
cd Derek\ Trucks\ Band\ -\ Joyful\ Noise\ \(2002\)/
python3 ../manifest_builder.py --title "Derek Trucks Band" --artist "Derek Trucks Band" --year 2002 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Derek\ Trucks\ Band\ -\ Joyful\ Noise\ \(2002\)/
unzip Chris\ Spedding\ \&\ John\ Cale\ -\ Live\ In\ Stockholm\ \(1975\).zip -d ./
cd Chris\ Spedding\ \&\ John\ Cale\ -\ Live\ In\ Stockholm\ \(1975\)
ls -l
python3 ../manifest_builder.py --title "Live In Stockholm" --artist "Chris Spedding & John Cale" --year 1975 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
cd Chris\ Spedding\ \&\ John\ Cale\ -\ Live\ In\ Stockholm\ \(1975\)/
python3 ../manifest_builder.py --title "Live In Stockholm" --artist "Chris Spedding & John Cale" --year 1975 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Chris\ Spedding\ \&\ John\ Cale\ -\ Live\ In\ Stockholm\ \(1975\)/
cd Dub\ Pistols\ -\ Return\ of\ the\ Pistoleros\ \(2015\)/
python3 ../manifest_builder.py --title "Return of the Pistoleros" --artist "Dub Pistols" --year 2015 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Dub\ Pistols\ -\ Return\ of\ the\ Pistoleros\ \(2015\)/
cd Pump/
python3 ../manifest_builder.py --title "Pump" --artist "Aerosmith" --year 1989 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Pump/
unzip Pete\ Haycock\ Band\ -\ Livin\'\ It.zip -d ./
cd Pete\ Haycock\ Band\ -\ Livin\'\ It
python3 ../manifest_builder.py --title "Livin' It" --artist "Pete Haycock Band" --year 2021 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Pete\ Haycock\ Band\ -\ Livin\'\ It
cd -rf Pete\ Haycock\ Band\ -\ Livin\'\ It.zip 
ךד -ך
ls -l
cd Air\ -\ Pocket\ Symphony/
python3 ../manifest_builder.py --title "Pocket Symphony" --artist "Air" --year 2007 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Air\ -\ Pocket\ Symphony/
unzip Al\ Kooper\ \&\ Mike\ Bloomfiled\ -\ Fillmore\ East\ The\ Lost\ Concert\ Tapes\ \(2003\).zip -d ./
rm -rf Al\ Kooper\ \&\ Mike\ Bloomfiled\ -\ Fillmore\ East\ The\ Lost\ Concert\ Tapes\ \(2003\).zip 
cd Al\ Kooper\ \&\ Mike\ Bloomfiled\ -\ Fillmore\ East\ The\ Lost\ Concert\ Tapes\ \(2003\)/
ls -l
python3 ../manifest_builder.py --title "Fillmore East: The Lost Concert Tapes" --artist "Al Kooper & Mike Bloomfiled" --year 2003 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Al\ Kooper\ \&\ Mike\ Bloomfiled\ -\ Fillmore\ East\ The\ Lost\ Concert\ Tapes\ \(2003\)/
unzip J.Viewz\ -\ Rivers\ And\ Homes.zip -D ./
unzip J.Viewz\ -\ Rivers\ And\ Homes.zip -d ./
rm -rf J.Viewz\ -\ Rivers\ And\ Homes
ls -l
unzip J.Viewz\ -\ Rivers\ And\ Homes.zip -d ./
rm -rf J.Viewz\ -\ Rivers\ And\ Homes.zip 
ls -l
unzip Jaga\ Jazzist\ -\ Airborne\ EP.zip -d ./
rm -rf Jaga\ Jazzist\ -\ Airborne\ EP.zip 
unzip Jaga\ Jazzist\ -\ Animal\ Chin\ EP.zip -d ./ -X
unzip Jaga\ Jazzist\ -\ Animal\ Chin\ EP.zip -d ./
ls -l
rm -rf Jaga\ Jazzist\ -\ Animal\ Chin\ EP.zip 
unzip Jaga\ Jazzist\ -\ What\ We\ Must.zip -d ./
rm -rf Jaga\ Jazzist\ -\ What\ We\ Must.zip 
ls -l
unzip Renegade\ Creation\ -\ Renegade\ Creation\ \(2010\).zip -d ./
rm -rf Renegade\ Creation\ -\ Renegade\ Creation\ \(2010\).zip 
rm -rf __MACOSX/
find J.Viewz\ -\ Rivers\ And\ Homes -type f \( -name '._*' -o -name '.DS_Store' \) -print
find J.Viewz\ -\ Rivers\ And\ Homes -type f \( -name '._*' -o -name '.DS_Store' \) -delete
nano ~/.bashrc
source ~/.bashrc
deleteacfiles Jaga\ Jazzist\ -\ Airborne\ EP
deletemacfiles Jaga\ Jazzist\ -\ Airborne\ EP
deletemacfiles Jaga\ Jazzist\ -\ Animal\ Chin\ EP
deletemacfiles Jaga\ Jazzist\ -\ What\ We\ Must
deletemacfiles Renegade\ Creation\ -\ Renegade\ Creation\ \(2010\)
cd J.Viewz\ -\ Rivers\ And\ Homes/
python3 ../manifest_builder.py --title "Rivers And Homes" --artist "J.Viewz" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
cd Jaga\ Jazzist\ -\ Airborne\ EP/
python3 ../manifest_builder.py --title "Airborne EP" --artist "Jaga Jazzist" --year 2000 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
python3 - << 'PY'
import os, boto3
from botocore.client import Config
def peek(name):
    v=os.environ.get(name,"")
    if not v: return "(unset)"
    return f"{name} len={len(v)} head={v[:4]}…tail={v[-4:]}"
print("ENV:",
      peek("SPACES_ENDPOINT"),
      peek("SPACES_BUCKET"),
      peek("SPACES_KEY"),
      peek("SPACES_SECRET"),
      peek("AWS_ACCESS_KEY_ID"),
      peek("AWS_SECRET_ACCESS_KEY"),
      sep="\n  ")

# ננסה קריאת head_bucket עם ה-SPACES_* בלבד
endpoint=os.environ.get("SPACES_ENDPOINT")
bucket=os.environ.get("SPACES_BUCKET")
key=os.environ.get("SPACES_KEY")
secret=os.environ.get("SPACES_SECRET")

s3=boto3.client("s3",
    endpoint_url=endpoint,
    aws_access_key_id=key,
    aws_secret_access_key=secret,
    region_name="sfo3",
    config=Config(signature_version="s3v4", s3={"addressing_style":"virtual"}))
try:
    s3.head_bucket(Bucket=bucket)
    print("HEAD_BUCKET:", bucket, "OK")
except Exception as e:
    print("HEAD_BUCKET ERROR:", type(e).__name__, e)
PY

unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
python3 - << 'PY'
import os, boto3
from botocore.client import Config
s3=boto3.client("s3",
    endpoint_url=os.environ["SPACES_ENDPOINT"],
    aws_access_key_id=os.environ.get("SPACES_KEY"),
    aws_secret_access_key=os.environ.get("SPACES_SECRET"),
    region_name="sfo3",
    config=Config(signature_version="s3v4", s3={"addressing_style":"virtual"}))
try:
    s3.head_bucket(Bucket=os.environ["SPACES_BUCKET"])
    print("HEAD_BUCKET: OK")
except Exception as e:
    print("HEAD_BUCKET ERROR:", type(e).__name__, e)
PY

cd ..
cd J.Viewz\ -\ Rivers\ And\ Homes/
python3 ../manifest_builder.py --title "Rivers And Homes" --artist "J.Viewz" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
python3 - << 'PY'
import os, boto3
from botocore.client import Config
s3=boto3.client("s3",
    endpoint_url=os.environ["SPACES_ENDPOINT"],
    aws_access_key_id=os.environ.get("SPACES_KEY"),
    aws_secret_access_key=os.environ.get("SPACES_SECRET"),
    region_name="sfo3",
    config=Config(signature_version="s3v4", s3={"addressing_style":"virtual"}))
try:
    s3.head_bucket(Bucket=os.environ["SPACES_BUCKET"])
    print("HEAD_BUCKET: OK")
except Exception as e:
    print("HEAD_BUCKET ERROR:", type(e).__name__, e)
PY

python3 - << 'PY'
import os
def peek(k):
    v=os.environ.get(k,"")
    if not v: return "(unset)"
    return f"{k}: len={len(v)} head={v[:4]}…tail={v[-4:]}"
print(
  peek("SPACES_ENDPOINT"),
  peek("SPACES_BUCKET"),
  peek("SPACES_KEY"),
  peek("SPACES_SECRET"),
  peek("AWS_ACCESS_KEY_ID"),
  peek("AWS_SECRET_ACCESS_KEY"),
  sep="\n"
)
PY

cd ..
python3 analyze_music.py 
cd albums/J.Viewz\ -\ Rivers\ And\ Homes/
python3 ../manifest_builder.py --title "Rivers And Homes" --artist "J.Viewz" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
export SPACES_KEY="DO00K8TNGF6JBWQJRQPL"
export SPACES_SECRET="FsVYWTn71s8LNgsplSb+cobZ0bUyHzKkGlABAd9u8+o"
export SPACES_KEY="$(printf %s "$SPACES_KEY" | tr -d '\r' | xargs)"
export SPACES_SECRET="$(printf %s "$SPACES_SECRET" | tr -d '\r' | xargs)"
python3 ../manifest_builder.py --title "Rivers And Homes" --artist "J.Viewz" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION AWS_PROFILE
export AWS_SHARED_CREDENTIALS_FILE=/dev/null
export AWS_CONFIG_FILE=/dev/null
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
export SPACES_KEY="DO00K8TNGF6JBWQJRQPL"
export SPACES_SECRET="FsVYWTn71s8LNgsplSb+cobZ0bUyHzKkGlABAd9u8+o"
export SPACES_KEY="DO00H7Z9FVRA7GLGFQ3V"
python3 ../manifest_builder.py --title "Rivers And Homes" --artist "J.Viewz" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
cd Jaga\ Jazzist\ -\ Airborne\ EP/
python3 ../manifest_builder.py --title "Airborne EP" --artist "Jaga Jazzist" --year 2000 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
בג ץץ
cd ..
rm -rf Jaga\ Jazzist\ -\ Airborne\ EP/
rm -rf J.Viewz\ -\ Rivers\ And\ Homes/
cd Jaga\ Jazzist\ -\ Animal\ Chin\ EP/
python3 ../manifest_builder.py --title "Animal Chin EP" --artist "Jaga Jazzist" --year 2003 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
cd Jaga\ Jazzist\ -\ Animal\ Chin\ EP/
cd ..
rm -rf Jaga\ Jazzist\ -\ Animal\ Chin\ EP/
cd Jaga\ Jazzist\ -\ What\ We\ Must/
python3 ../manifest_builder.py --title "What We Must" --artist "Jaga Jazzist" --year 2005 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Jaga\ Jazzist\ -\ What\ We\ Must/
cd Renegade\ Creation\ -\ Renegade\ Creation\ \(2010\)/
python3 ../manifest_builder.py --title "Renegade Creation" --artist "Renegade Creation" --year 2010 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Renegade\ Creation\ -\ Renegade\ Creation\ \(2010\)/
cd Basement\ Jaxx\ -\ Remedy/
python3 ../manifest_builder.py --title "Remedy" --artist "Basement Jaxx" --year 1999 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Basement\ Jaxx\ -\ Remedy/
cd Alex\ Warren\ -\ You\'ll\ Be\ Alright\,\ Kid\ \(Chapter\ 1\)\ 2024/
python3 ../manifest_builder.py --title " You'll Be Alright, Kid (Chapter 1)" --artist "Alex Warren" --year 2024 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
cd /root/
ls -l
cd albums/
cd Bon\ Iver\,\ Bon\ Iver\ 2011/
python3 ../manifest_builder.py --title "Bon Iver" --artist "Bon Iver" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
cd /root/
cd albums/
cd Bon\ Iver\,\ Bon\ Iver\ 2011/
python3 ../manifest_builder.py --title "Bon Iver" --artist "Bon Iver" --year 2011 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
בג ץץ
cd ..
rm -rf Bon\ Iver\,\ Bon\ Iver\ 2011/
unzip Augustus\ Pablo\ -\ Classic\ Rockers.zip 
unzip BillyLee\ Janey\ -\ Crazy\ 8.zip 
cd Augustus\ Pablo\ -\ Classic\ Rockers/
python3 ../manifest_builder.py --title "Classic Rockers" --artist "Augustus Pablo" --year 1995 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
python3 ../manifest_builder.py --title "Classic Rockers" --artist "Augustus Pablo" --year 1995 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes --is-electronic
cd ..
rm -rf Augustus\ Pablo\ -\ Classic\ Rockers/
ls -l
rm -rf __MACOSX/
cd BillyLee\ Janey\ -\ Crazy\ 8
python3 ../manifest_builder.py --title "Crazy 8" --artist "BillyLee Janey" --year 2003 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf BillyLee\ Janey\ -\ Crazy\ 8/
ls -l
cd Bon\ Iver\ -\ The\ MySpace\ Transmissions\ \(Live\ Internet\ EP\)\ 2008/
ls -l
python3 ../manifest_builder.py --title "The MySpace Transmissions (Live Internet EP)" --artist "Bon Iver" --year 2008 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Bon\ Iver\ -\ The\ MySpace\ Transmissions\ \(Live\ Internet\ EP\)\ 2008/
ls -l
unzip Enigma\ -\ Voyageur.zip -d ./
rm -rf Enigma\ -\ Voyageur.zip Enigma\ -\ Valley\ Of\ Dreams/
rm -rf __MACOSX/
cd Enigma\ -\ Voyageur/
python3 ../manifest_builder.py --title "Voyageur" --artist "Enigma" --year 2003 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Enigma\ -\ Voyageur/
cd Aynsley\ Lister\ -\ Everything\ I\ Need/
python3 ../manifest_builder.py --title "Everything I Need" --artist "Aynsley Lister" --year 2004 --spaces-endpoint "https://sfo3.digitaloceanspaces.com" --spaces-bucket "mooda-music" --upload-yes
cd ..
rm -rf Aynsley\ Lister\ -\ Everything\ I\ Need/ High\ Tone\ -\ Underground\ Wobble/
unzip Beastie\ Boys\ -\ Check\ Your\ Head\ \(1992\).zip -d ./
rm -rf Beastie\ Boys\ -\ Check\ Your\ Head\ \(1992\).zip 
rm -rf __MACOSX/
python3 manifest_builder.py Beastie\ Boys\ -\ Check\ Your\ Head\ \(1992\)/
unzip Beastie\ Boys\ -\ Hot\ Sauce\ Committee\ Part\ Two\ \(2011\).zip 
rm -rf Beastie\ Boys\ -\ Hot\ Sauce\ Committee\ Part\ Two\ \(2011\).zip 
unzip Beastie\ Boys\ -\ Ill\ Communication\ \(1994\).zip -d ./
rm -rf Beastie\ Boys\ -\ Ill\ Communication\ \(1994\).zip 
rm -rf __MACOSX/
python3 manifest_builder.py Beastie\ Boys\ -\ Hot\ Sauce\ Committee\ Part\ Two\ \(2011\)/
ffprobe -hide_banner -loglevel error -show_format -show_streams "01 make some noise.mp3
;
"
cd Beastie\ Boys\ -\ Hot\ Sauce\ Committee\ Part\ Two\ \(2011\)/
ffprobe -hide_banner -loglevel error -show_format -show_streams "01 make some noise.mp3"
cd mp3\@320/
ffprobe -hide_banner -loglevel error -show_format -show_streams "01 make some noise.mp3"
cd ..
cd Beastie\ Boys\ -\ Hot\ Sauce\ Committee\ Part\ Two\ ;
rm -rf Beastie\ Boys\ -\ Hot\ Sauce\ Committee\ Part\ Two\ \(2011\)/
ls -l
cd Beastie\ Boys\ -\ Ill\ Communication\ \(1994\)/
cd ..
python3 manifest_builder.py Beastie\ Boys\ -\ Ill\ Communication\ \(1994\)/
unzip Beastie\ Boys\ -\ Licensed\ to\ Ill\ \(1986\).zip -d ./
python3 Beastie\ Boys\ -\ Licensed\ to\ Ill\ \(1986\)
python3 manifest_builder.py Beastie\ Boys\ -\ Licensed\ to\ Ill\ \(1986\)
rm -rf __MACOSX/
rm -rf Beastie\ Boys\ -\ Licensed\ to\ Ill\ \(1986\).zip 
unzip sly\ \&\ the\ family\ stone\ -\ there\'s\ a\ riot\ goin\'\ on\ 1\ -\ 1971.zip -d ./
rm -rf sly\ \&\ the\ family\ stone\ -\ there\'s\ a\ riot\ goin\'\ on\ 1\ -\ 1971.zip __MACOSX/
python3 manifest_builder.py sly\ \&\ the\ family\ stone\ -\ there\'s\ a\ riot\ goin\'\ on\ 1\ -\ 1971/
ls -l
cd albums/
unzip High\ Tone\ -\ Underground\ Wobble.zip -d ./
rm -rf High\ Tone\ -\ Underground\ Wobble.zip 
unzip High\ Tone\ -\ Wangtone\ -\ Wang\ Lei\ meets\ High\ Tone\ \(2005\).zip -d ./
rm -rf High\ Tone\ -\ Wangtone\ -\ Wang\ Lei\ meets\ High\ Tone\ \(2005\).zip 
unzip Aynsley\ Lister\ -\ Everything\ I\ Need.zip -d ./
rm -rf Aynsley\ Lister\ -\ Everything\ I\ Need.zip 
rm -rf __MACOSX/
cd albums/
python3 manifest_builder.py "lee 'scratch' perry - skanking with the upsetter rare dubs, 1971-1974"/
unzip Massive\ Attack\ -\ 100th\ Window.zip -d ./
rm -rf __MACOSX/
unzip Aim\ -\ Hinterland.zip 
rm -rf __MACOSX/
python3 manifest_builder.py Aim\ -\ Hinterland
export SPACES_KEY="DO002YCGBQ8WZ2DKMU7N"
export SPACES_SECRET="FP0wgQ+3sAi+dws2/VnL4KBF0zECk2jgDWwmTH1PAy8"
python3 manifest_builder.py Aim\ -\ Hinterland
rm -rf Aim\ -\ Hinterland.zip 
unzip Alanis\ Morissette\ -\ So\ Called\ Chaos\ 2004.zip 
python3 manifest_builder.py Alanis\ Morissette\ -\ So\ Called\ Chaos\ 2004
rm -rf Alanis\ Morissette\ -\ So\ Called\ Chaos\ 2004.zip 
unzip Alanis\ Morissette\ -\ So\ Called\ Chaos\ 2004/
rm -rf Alanis\ Morissette\ -\ So\ Called\ Chaos\ 2004/
cd albums/
unzip 'Al Di Meola- World Sinfonia 1991.zip' 
rm -rf __MACOSX/
python3 manifest_builder.py 'Al Di Meola- World Sinfonia 1991'
cd albums/
unzip Air\ -\ Pocket\ Symphony.zip 
python3 manifest_builder.py Air\ -\ Pocket\ Symphony
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
export SPACES_KEY="DO00H7Z9FVRA7GLGFQ3V"
export SPACES_SECRET="FsVYWTn71s8LNgsplSb+cobZ0bUyHzKkGlABAd9u8+o"
export SPACES_KEY="$(printf %s "$SPACES_KEY" | tr -d '\r' | xargs)"
export SPACES_SECRET="$(printf %s "$SPACES_SECRET" | tr -d '\r' | xargs)"
python3 manifest_builder.py Air\ -\ Pocket\ Symphony
rm -rf Air\ -\ Pocket\ Symphony.zip 
unzip Beastie\ Boys\ -\ To\ the\ 5\ Boroughs\ \(2004\).zip -d ./
unzip sly\ \&\ the\ family\ stone\ -\ small\ talk.zip -d ./
unzip sly\ \&\ the\ family\ stone\ -\ a\ whole\ new\ thing.zip -d ./
rm -rf __MACOSX/ Beastie\ Boys\ -\ To\ the\ 5\ Boroughs\ \(2004\) sly\ \&\ the\ family\ stone\ -\ a\ whole\ new\ thing sly\ \&\ the\ family\ stone\ -\ small\ talk
unzip Beastie\ Boys\ -\ To\ the\ 5\ Boroughs\ \(2004\).zip -d ./
unzip sly\ \&\ the\ family\ stone\ -\ small\ talk.zip -d ./
unzip sly\ \&\ the\ family\ stone\ -\ a\ whole\ new\ thing.zip -d ./
cd Beastie\ Boys\ -\ To\ the\ 5\ Boroughs\ \(2004\)/
cd ..
python3 manifest_builder.py Beastie\ Boys\ -\ To\ the\ 5\ Boroughs\ \(2004\)/
cd sly\ \&\ the\ family\ stone\ -\ a\ whole\ new\ thing/
cd ..
python3 sly\ \&\ the\ family\ stone\ -\ a\ whole\ new\ thing/
python3 manifest_builder.py sly\ \&\ the\ family\ stone\ -\ a\ whole\ new\ thing/
ls -l
python3 manifest_builder.py sly\ \&\ the\ family\ stone\ -\ small\ talk/
ךד -ך
ls -l
unzip B.\ Brain\ -\ Experiences\ 2013.zip -d ./
ls -l
sudo rm -rf B.\ Brain\ -\ Experiences\ 2013.zip 
unzip B.\ Brain\ -\ Piqure\ De\ Rappel\ 2016.zip -d ./
rm -rf B.\ Brain\ -\ Piqure\ De\ Rappel\ 2016.zip 
ls -l
unzip Dub\ Syndicate\ -\ Fear\ Of\ A\ Green\ Planet\ \(25th\ Anniversary\ Expanded\ Edition\)\ \(2023\).zip -d ./
ls -l
rm -rf Dub\ Syndicate\ -\ Fear\ Of\ A\ Green\ Planet\ \(25th\ Anniversary\ Expanded\ Edition\)\ \(2023\).zip __MACOSX/
python3 manifest_builder.py B.\ Brain\ -\ Experiences\ 2013/
cd B.\ Brain\ -\ Piqure\ De\ Rappel\ 2016/
CD ..
cd ..
python3 manifest_builder.py B.\ Brain\ -\ Piqure\ De\ Rappel\ 2016/
python3 manifest_builder.py Dub\ Syndicate\ -\ Fear\ Of\ A\ Green\ Planet\ \(25th\ Anniversary\ Expanded\ Edition\)\ \(2023\)/
LS -L
ls -l
rm -rf Dub\ Syndicate\ -\ Fear\ Of\ A\ Green\ Planet\ \(25th\ Anniversary\ Expanded\ Edition\)\ \(2023\)/
unzip Aaliyah\ -\ Hits\ \&\ Unreleased\ \(The\ Ultimate\ Collection\)\ 2002.zip 
unzip 50\ Cent\ -\ Before\ I\ Self\ Destruct\ 2009.zip 
unzip 50\ Cent\ -\ Curtis\ 2007.zip 
unzip 50\ Cent\ -\ War\ Angel\ LP\ 2009.zip 
rm -rf __MACOSX/ 50\ Cent\ -\ Before\ I\ Self\ Destruct\ 2009.zip 50\ Cent\ -\ Curtis\ 2007.zip 
unzip 50\ Cent\ -\ War\ Angel\ LP\ 2009.zip 
n
unzip Aaliyah\ -\ Hits\ \&\ Unreleased\ \(The\ Ultimate\ Collection\)\ 2002
unzip Aaliyah\ -\ Hits\ \&\ Unreleased\ \(The\ Ultimate\ Collection\)\ 2002.zip 
unzip 50\ Cent\ -\ War\ Angel\ LP\ 2009.zip 
LS -L
ls -l
rm -rf 50\ Cent\ -\ War\ Angel\ LP\ 2009.zip 
rm -rf Aaliyah\ -\ Hits\ \&\ Unreleased\ \(The\ Ultimate\ Collection\)\ 2002.zip 
python3 manifest_builder.py 2009\ -\ War\ Angel\ LP/
rm -rf 2009\ -\ War\ Angel\ LP/
cd 50\ Cent\ -\ Before\ I\ Self\ Destruct\ 2009/
cd ..
python3 manifest_builder.py 50\ Cent\ -\ Before\ I\ Self\ Destruct\ 2009/
python3 manifest_builder.py 50\ Cent\ -\ Curtis\ 2007/
python3 manifest_builder.py Aaliyah\ -\ Hits\ \&\ Unreleased\ \(The\ Ultimate\ Collection\)\ 2002/
df -h
unzip Massive\ Attack\ -\ 100th\ Window.zip 
cd Massive\ Attack\ -\ 100th\ Window
ls -l
cd ..
python3 manifest_builder.py Massive\ Attack\ -\ 100th\ Window
rm -rf Massive\ Attack\ -\ 100th\ Window.zip 
unzip Akon-\ Ain’t\ No\ Peace\ 2020.zip 
python3 manifest_builder.py 'Akon - Ain’t No Peace 2020'/
export SPACES_KEY="DO002YCGBQ8WZ2DKMU7N"
export SPACES_SECRET="FP0wgQ+3sAi+dws2/VnL4KBF0zECk2jgDWwmTH1PAy8"
python3 manifest_builder.py 'Akon - Ain’t No Peace 2020'/
python3 manifest_builder.py 'Al Di Meola- World Sinfonia 1991'
ls -l
python3 manifest_builder.py 'lee scratch perry & dub syndicate - time bomb x de devil death'/
python3 manifest_builder.py 'lee scratch perry and dub syndicate - time bomb x de devil death'/
ls -l
rm -rf __MACOSX/
cd "lee scratch perry meets bullwackie - in satan's dub 1990"/
cd ..
python3 manifest_builder.py "lee scratch perry meets bullwackie - in satan's dub 1990"/
ls -l
rm -rf "lee ''scratch'' perry meets bullwackie - in satan's dub 1990.zip" 
ls -l
python3 manifest_builder.py goldfrapp\ -\ seventh\ tree\ 2008/
rm -rf goldfrapp\ -\ seventh\ tree\ 2008.zip 
ls -l
python3 manifest_builder.py goldfrapp\ -\ 2017\ -\ silver\ eye/
ls -l
rm -rf goldfrapp\ -\ 2017\ -\ silver\ eye.zip 
rm -rf __MACOSX/
ls -l
python3 manifest_builder.py Teyana\ Taylor\ -\ The\ Album\ 2020/
ls -l
rm -rf Teyana\ Taylor\ -\ The\ Album\ 2020.zip 
python3 manifest_builder.py Snoop\ Dogg\ -\ R\&G\ \(Rhythm\ \&\ Gangsta\)\ The\ Masterpiece\ 2004/
ls -l
rm -rf Snoop\ Dogg\ -\ R\&G\ \(Rhythm\ \&\ Gangsta\)\ The\ Masterpiece\ 2004.zip 
ls -l
python3 manifest_builder.py Black\ Eyed\ Peas\ -\ The\ E.N.D/
ls -l
rm -rf The\ End.zip __MACOSX/
ls -l
python3 manifest_builder.py Sly\ \&\ the\ Family\ Stone\ -\ Greatest\ Hits/
ls -l
rm -rf Sly\ \&\ the\ Family\ Stone\ -\ Greatest\ Hits.zip 
python3 manifest_builder.py Pink\ Floyd\ -\ More\ \(EMI\)\ \(1969\)/
ls -l
rm -rf Pink\ Floyd\ -\ More\ \(EMI\)\ \(1969\).zip 
python3 manifest_builder.py Pink\ Floyd\ -\ Meddle\ \(Harvest\)\ \(1971-11-05\)/
ls -l
rm -rf Pink\ Floyd\ -\ Meddle\ \(Harvest\)\ \(1971-11-05\).zip 
python3 manifest_builder.py Pink\ Floyd\ -\ A\ Saucerful\ Of\ Secrets\ \(Columbia\ \(EMI\)\)\ \(1968-06-29\)/
ls -l
rm -rf Pink\ Floyd\ -\ A\ Saucerful\ Of\ Secrets\ \(Columbia\ \(EMI\)\)\ \(1968-06-29\).zip 
ls -l
python3 manifest_builder.py Paco\ De\ Lucia\ -\ El\ Duende\ Flamenco\ de\ Paco\ de\ Lucia\ 1972/
ls -l
rm -rf Paco\ De\ Lucia\ -\ El\ Duende\ Flamenco\ de\ Paco\ de\ Lucia\ 1972.zip 
ls -l
python3 manifest_builder.py Norah\ Jones\ -\ Pick\ Me\ Up\ Off\ The\ Floor/
ls -l
rm -rf Norah\ Jones\ -\ Pick\ Me\ Up\ Off\ The\ Floor.zip 
ls -l
python3 manifest_builder.py Miles\ Davis\ -\ Amsterdam\ Concert\ \(Featuring\ Barney\ Wilen\)\ 1957/
ls -l
rm -rf __MACOSX/ Miles\ Davis\ -\ Amsterdam\ Concert\ \(Featuring\ Barney\ Wilen\)\ 1957.zip 
ls -l
python3 manifest_builder.py Miles\ Davis\ -\ 1972\ On\ The\ Corner/
ls -l
rm -rf Miles\ Davis\ -\ 1972\ On\ The\ Corner.zip 
ls -l
cd Massive\ Attack\ -\ Protection\ 1994
cd ..
python3 manifest_builder.py Massive\ Attack\ -\ Protection\ 1994
ls -l
rm -rf Massive\ Attack\ -\ Protection\ 1994.zip
ls -l
python3 manifest_builder.py Massive\ Attack\ -\ Heligoland\ 2010/
ls -l
rm -rf Massive\ Attack\ -\ Heligoland\ 2010.zip 
ls -l
python3 Lee\ Scratch\ Perry\ \&\ Dub\ Syndicate\ \ -\ From\ The\ Secret\ Laboratory\ 1990
python3 manifest_builder.py Lee\ Scratch\ Perry\ \&\ Dub\ Syndicate\ \ -\ From\ The\ Secret\ Laboratory\ 1990/
ls -l
rm -rf Lee\ Scratch\ Perry\ \&\ Dub\ Syndicate\ \ -\ From\ The\ Secret\ Laboratory\ 1990.zip 
ls -l
python3 manifest_builder.py John\ Mayer\ -\ Sob\ Rock/
rm -rf John\ Mayer\ -\ Sob\ Rock.zip 
ls -l
python3 manifest_builder.py Lee\ Scratch\ Perry\ -\ Roast\ Fish\ and\ Cornbread/
ls -l
rm -rf Lee\ Scratch\ Perry\ -\ Roast\ Fish\ and\ Cornbread.zip 
python3 manifest_builder.py John\ Coltrane\ -\ Giant\ Steps\ 1960/
ls -l
rm -rf John\ Coltrane\ -\ Giant\ Steps\ 1960.zip 
ls -l
python3 manifest_builder.py Jimi\ Hendrix\ \&\ John\ McLaughlin\ -\ New\ York\ 03.25.69/
ls -l
rm -rf Jimi\ Hendrix\ \&\ John\ McLaughlin\ -\ New\ York\ 03.25.69.zip 
ls -l
python3 manifest_builder.py Jazz\ on\ the\ Latin\ Side\ All\ Stars\ -\ 2004\ The\ Last\ Bullfighter/
python3 manifest_builder.py Jazz\ on\ the\ Latin\ Side\ All\ Stars\ -\ 2007\ Tambolero/
ls -l
rm -rf Jazz\ on\ the\ Latin\ Side\ All\ Stars\ -\ 2004\ The\ Last\ Bullfighter.zip 
rm -rf Jazz\ on\ the\ Latin\ Side\ All\ Stars\ -\ 2007\ Tambolero.zip 
ls -l
python3 manifest_builder.py Jason\ Mraz\ -\ Waiting\ for\ My\ Rocket\ to\ Come\ 2003/
rm -rf Jason\ Mraz\ -\ Waiting\ for\ My\ Rocket\ to\ Come\ 2003.zip 
ls -l
python3 manifest_builder.py Humberto\ Ramirez\ -\ Plays\ Miles\ Davis/
rm -rf Humberto\ Ramirez\ -\ Plays\ Miles\ Davis.zip 
ls -l
python3 manifest_builder.py Frank\ Sinatra\ -\ Francis\ Albert\ Sinatra\ \&\ Antonio\ Carlos\ Jobim\ 1967\ \(50th\ Anniversary\ Edition\,\ 2017\)
ls -l
python3 manifest_builder.py Frank\ Sinatra\ \&\ Count\ Basie\ -\ The\ Complete\ Reprise\ Studio\ Recordings\ 2011/
ls -l
rm -rf Frank\ Sinatra\ \&\ Count\ Basie\ -\ The\ Complete\ Reprise\ Studio\ Recordings\ 2011.zip 
rm -rf Frank\ Sinatra\ -\ Francis\ Albert\ Sinatra\ \&\ Antonio\ Carlos\ Jobim\ 1967\ \(50th\ Anniversary\ Edition\,\ 2017\).zip 
ls -l
unzip Alice\ In\ Chains\ -\ Live\ 2000.zip 
unzip Alice\ Cooper\ -\ Love\ It\ To\ Death\ 1971.zip 
rm -rf __MACOSX/
python3 manifest_builder.py Alice\ In\ Chains\ -\ Live\ 2000/
rm -rf Alice\ In\ Chains\ -\ Live\ 2000.zip 
python3 manifest_builder.py Alice\ Cooper\ -\ Love\ It\ To\ Death\ 1971/
rm -rf Alice\ Cooper\ -\ Love\ It\ To\ Death\ 1971.zip 
ls -l
python3 manifest_builder.py Ella\ Fitzgerald\ -\ Sings\ The\ Cole\ Porter\ Song\ Book\,\ Vol.\ 1\ \(1956\)/
python3 manifest_builder.py Ella\ Fitzgerald\ -\ Sings\ The\ Cole\ Porter\ Song\ Book\,\ Vol.\ 2\ \(1956\)/
ls -l
python3 manifest_builder.py Ella\ Fitzgerald\ -\ Fitzgerald\ \&\ Pass...\ Again/
rm -rf Ella\ Fitzgerald\ -\ Fitzgerald\ \&\ Pass...\ Again.zip 
rm -rf Ella\ Fitzgerald\ -\ Sings\ The\ Cole\ Porter\ Song\ Book\,\ Vol.\ 1\ \(1956\).zip 
rm -rf Ella\ Fitzgerald\ -\ Sings\ The\ Cole\ Porter\ Song\ Book\,\ Vol.\ 2\ \(1956\).zip
ls -l
python3 manifest_builder.py David\ Gilmour\ -\ About\ Face/
rm -rf David\ Gilmour\ -\ About\ Face.zip 
ls -l
python3 manifest_builder.py Black\ Eyed\ Peas\ -\ Behind\ the\ Front/
rm -rf Black\ Eyed\ Peas\ -\ Behind\ the\ Front.zip 
ls -l
python3 manifest_builder.py America\ -\ Your\ Move\ 1983/
python3 manifest_builder.py America\ -\ Harbor\ 1977/
rm -rf America\ -\ Harbor\ 1977.zip 
ls -l
python3 manifest_builder.py 2022\ -\ Cafe\ Del\ Mar\ 28/
rm -rf 2022\ -\ Cafe\ Del\ Mar\ 28.zip 
ls -l
python3 manifest_builder.py America\ -\ Alibi\ 1980/
rm -rf __pycache__/
cd albums/
rm -rf __MACOSX/
ls -l
unzip 'lee scratch perry & dub syndicate - time bomb x de devil death.zip' 
rm -rf 'lee scratch perry & dub syndicate - time bomb x de devil death'
ls -l
rm -rf __MACOSX/
unzip 'lee scratch perry & dub syndicate - time bomb x de devil death.zip' 
rm -rf 'lee scratch perry & dub syndicate - time bomb x de devil death.zip' 
rm -rf __MACOSX/
ls -l
unzip "lee ''scratch'' perry meets bullwackie - in satan's dub 1990.zip" 
rm -rf __MACOSX/
ls -l
unzip goldfrapp\ -\ seventh\ tree\ 2008.zip 
ls -l
unzip goldfrapp\ -\ 2017\ -\ silver\ eye.zip 
ls -l
unzip The\ End.zip 
ls -l
unzip Teyana\ Taylor\ -\ The\ Album\ 2020.zip 
ls -l
unzip Snoop\ Dogg\ -\ R\&G\ \(Rhythm\ \&\ Gangsta\)\ The\ Masterpiece\ 2004.zip 
ls -l
unzip Sly\ \&\ the\ Family\ Stone\ -\ Greatest\ Hits.zip 
ls -l
rm -rf __MACOSX/
unzip Pink\ Floyd\ -\ More\ \(EMI\)\ \(1969\).zip 
unzip Pink\ Floyd\ -\ Meddle\ \(Harvest\)\ \(1971-11-05\).zip 
ls -l
unzip Pink\ Floyd\ -\ A\ Saucerful\ Of\ Secrets\ \(Columbia\ \(EMI\)\)\ \(1968-06-29\).zip 
rm -rf Akon-\ Ain’t\ No\ Peace\ 2020.zip 
ls -l
unzip Paco\ De\ Lucia\ -\ El\ Duende\ Flamenco\ de\ Paco\ de\ Lucia\ 1972.zip 
ls -l
unzip Norah\ Jones\ -\ Pick\ Me\ Up\ Off\ The\ Floor.zip 
ls -l
unzip Miles\ Davis\ -\ 1972\ On\ The\ Corner.zip 
ls -l
unzip Miles\ Davis\ -\ Amsterdam\ Concert\ \(Featuring\ Barney\ Wilen\)\ 1957.zip 
ls -l
rm -rf __MACOSX/
ls -l
unzip Massive\ Attack\ -\ Heligoland\ 2010.zip 
ls -l
unzip Massive\ Attack\ -\ Protection\ 1994.zip 
rm -rf __MACOSX/
ls -l
unzip Lee\ Scratch\ Perry\ -\ Roast\ Fish\ and\ Cornbread.zip 
ls -l
unzip Lee\ Scratch\ Perry\ -\ Roast\ Fish\ and\ Cornbread.zip 
ls -l
unzip Lee\ Scratch\ Perry\ \&\ Dub\ Syndicate\ \ -\ From\ The\ Secret\ Laboratory\ 1990.zip 
ls -l
unzip John\ Mayer\ -\ Sob\ Rock.zip 
unzip John\ Coltrane\ -\ Giant\ Steps\ 1960.zip 
ls -l
unzip Jimi\ Hendrix\ \&\ John\ McLaughlin\ -\ New\ York\ 03.25.69.zip 
ls -l
unzip Jason\ Mraz\ -\ Waiting\ for\ My\ Rocket\ to\ Come\ 2003.zip 
ls -l
unzip Jazz\ on\ the\ Latin\ Side\ All\ Stars\ -\ 2004\ The\ Last\ Bullfighter.zip 
unzip Jazz\ on\ the\ Latin\ Side\ All\ Stars\ -\ 2007\ Tambolero.zip 
ls -l
unzip Humberto\ Ramirez\ -\ Plays\ Miles\ Davis.zip 
ls -l
unzip Frank\ Sinatra\ -\ Francis\ Albert\ Sinatra\ \&\ Antonio\ Carlos\ Jobim\ 1967\ \(50th\ Anniversary\ Edition\,\ 2017\).zip 
ls -l
unzip Frank\ Sinatra\ \&\ Count\ Basie\ -\ The\ Complete\ Reprise\ Studio\ Recordings\ 2011.zip 
ls -l
rm -rf __MACOSX/
ls -l
unzip Ella\ Fitzgerald\ -\ Sings\ The\ Cole\ Porter\ Song\ Book\,\ Vol.\ 1\ \(1956\).zip 
unzip Ella\ Fitzgerald\ -\ Sings\ The\ Cole\ Porter\ Song\ Book\,\ Vol.\ 2\ \(1956\).zip 
ls -l
unzip Ella\ Fitzgerald\ -\ Fitzgerald\ \&\ Pass...\ Again.zip 
ls -l
unzip David\ Gilmour\ -\ About\ Face.zip 
ls -l
unzip Buckwild\ -\ Diggin\'\ In\ The\ Tuff\ Kong\ Crates\ 2022.zip 
ls -l
unzip Black\ Eyed\ Peas\ -\ Behind\ the\ Front.zip 
ls -l
unzip Beyonce\ -\ Lemonade\ 2016.zip 
ls -l
unzip America\ -\ Your\ Move\ 1983.zip 
ls -l
unzip America\ -\ Silent\ Letter\ 1979.zip 
ls -l
unzip America\ -\ Hideaway\ 1976.zip 
ls -l
unzip America\ -\ Harbor\ 1977.zip 
ls -l
unzip America\ -\ Alibi\ 1980.zip 
ls -l
unzip 2022\ -\ Cafe\ Del\ Mar\ 28.zip 
rm -rf __MACOSX/
cd albums/
python3 manifest_builder.py America\ -\ Silent\ Letter\ 1979/
export SPACES_ENDPOINT="https://sfo3.digitaloceanspaces.com"
export SPACES_BUCKET="mooda-music"
export SPACES_KEY="DO00RYWR9N4GNLVYJC2K"
export SPACES_SECRET="7hJUdVcztksEtqc4DGdnFQYzhqHIxB6ZWeEq3MEDl9w"
python3 manifest_builder.py America\ -\ Silent\ Letter\ 1979/
python3 manifest_builder.py America\ -\ Hideaway\ 1976/
python3 manifest_builder.py 2022\ -\ Diggin\'\ In\ The\ Tuff\ Kong\ Crates/
python3 manifest_builder.py America\ -\ Your\ Move\ 1983.zip 
unzip America\ -\ Your\ Move\ 1983.zip -d ./
rm -rf __MACOSX/
cd America\ -\ Your\ Move\ 1983
ls -l
cd..
cd voteBot/
npm init -y
npm i telegraf
node index.js 
npm i telegraf playwright
npx playwright install --with-deps
node index.js 
npx playwright install --with-deps
node index.js 
cd albums/
unzip 2pac\ -\ Strictly\ 4\ My\ N.I.G.G.A.Z\ 1993\ -\ ready.zip 
unzip 8Ball\ And\ MJG\ -\ From\ The\ Bottom\ 2\ The\ Top\ \(CD\)\ 2010\ -\ ready.zip 
unzip 50\ Cent\ -\ Get\ Rich\ Or\ Die\ Tryin\'\ 2003\ -\ ready.zip 
unzip 50\ Cent\ -\ Guess\ Who\'s\ Back\ 2002\ -\ ready.zip 
unzip 50\ Cent\ -\ No\ Mercy\,\ No\ Fear\ 2002\ -\ ready.zip 
unzip 50\ Cent\ -\ Power\ of\ the\ Dollar\ 2000\ -\ ready.zip 
unzip 50\ Cent\ -\ Sincerely\ Yours\,\ Southside\ 2008\ -\ ready.zip 
unzip 50\ Cent\ -\ The\ Big\ 10\ 2011\ -\ ready.zip 
unzip 50\ Cent\ -\ The\ Massacre\ 2005\ -\ ready.zip 
unzip 50\ Cent\ -\ The\ Collaboration\ \ EP\ 2003\ -\ ready.zip 
unzip 50\ Cent\ -\ War\ Angel\ LP\ 2009\ -\ ready.zip 
unzip Amy\ Winehouse\ -\ Lioness\ \|\ Hidden\ Treasures\ 2011\ -\ ready.zip 
rm -rf __MACOSX/
df -h
cd ..
python3 analyze_music.py 
df -h
cd albums/
python3 manifest_builder.py 2pac\ -\ Strictly\ 4\ My\ N.I.G.G.A.Z\ 1993.Z/
export SPACES_KEY="DO002YCGBQ8WZ2DKMU7N"
export SPACES_SECRET="FP0wgQ+3sAi+dws2/VnL4KBF0zECk2jgDWwmTH1PAy8"
python3 manifest_builder.py 2pac\ -\ Strictly\ 4\ My\ N.I.G.G.A.Z\ 1993.Z/
python3 manifest_builder.py 8Ball\ And\ MJG\ -\ From\ The\ Bottom\ 2\ The\ Top\ \(CD\)\ 2010/
python3 manifest_builder.py 50\ Cent\ -\ Get\ Rich\ Or\ Die\ Tryin\'\ 2003/
python3 manifest_builder.py 50\ Cent\ -\ Guess\ Who\'s\ Back\ 2002/
python3 manifest_builder.py 50\ Cent\ -\ No\ Mercy\,\ No\ Fear\ 2002/
df -h
python3 manifest_builder.py 50\ Cent\ -\ Power\ of\ the\ Dollar\ 2000/
python3 manifest_builder.py 50\ Cent\ -\ Sincerely\ Yours\,\ Southside\ 2008/
python3 manifest_builder.py 50\ Cent\ -\ The\ Big\ 10\ 2011/
python3 manifest_builder.py 50\ Cent\ -\ The\ Collaboration\ \ EP\ 2003/
df -h
בג ץץ
cd ..
sudo apt install -y curl ca-certificates gnupg build-essential
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
cd clicker/
npm init -y
npm i -D playwright
npx playwright install-deps
npx playwright install
node clicker.js 
cd ..
cd tg-distrotools-bot/
npm init -y
npm install telegraf dotenv
npm run start
בג ץץ
בג
cd ..
cd clicker/
node clicker.js 
node clicker/clicker.js 
mkdir spotify
cd spotify/
npm i
npm init
nano index.js
node index.js 
npm i playwright
node index.js 
npx playwright install
node index.js 
cd clicker/
node clicker.js 
cd clicker/
node clicker.js 
node clicker/clicker.js 
cd clicker/
sudo npm install -g pm2
pm2 -v
pm2 start clicker.js 
pm2 save
pm2 startup
pm2 status
cd ..
cd albums/
export SPACES_KEY="DO801AK4GNEDQMHTWQ6B"
export SPACES_SECRET="s4EoL4Um+ZfYt1XA026gZ6K/yE7MOZ/OO8PG1dRvBok"
python3 spaces_migrate_keys_to_manifest.py
pm2 status
pm2 logs
