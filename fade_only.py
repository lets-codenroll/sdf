from omnizart.music.app import DrumTranscription

drum = DrumTranscription()
result = drum.transcribe("music/your_file.wav")  # חייב WAV

# result הוא DataFrame עם עמודות: onset, duration, instrument (kick/snare/hihat)
print(result)
