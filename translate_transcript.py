import whisper
import sys

# model_type = "tiny"
# model_type = "base"
# model_type = "small"
model_type = "medium"
# model_type = "large"

# "translate" or "transcribe"
task = sys.argv[2] if sys.argv[2] else "translate"

model = whisper.load_model(model_type)
result = model.transcribe(audio=sys.argv[1], language="Portuguese", task=task)
print(result["text"])