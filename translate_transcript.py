import whisper
import sys

model = whisper.load_model("small")
result = model.transcribe(audio=sys.argv[1], language="Portuguese", task="translate")
print(result["text"])