import whisper

model = whisper.load_model("small")
# result = model.transcribe(audio="videos/Santacruz_spanish_eng/spanish.wav", language="Spanish", task="translate")
result = model.transcribe(audio="video-pt/audio.wav", language="Portuguese", task="translate")
print(result["text"])

from TTS.api import TTS
tts = TTS(model_name="tts_models/multilingual/multi-dataset/your_tts", gpu=True)
tts.tts_to_file(text=result['text'], language="en", speaker_wav="video-pt/audio.wav", file_path="video-pt/eng.wav")
