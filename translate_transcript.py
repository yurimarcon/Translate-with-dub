import whisper
import sys
import json

input_audio = sys.argv[1]
task = sys.argv[2] if sys.argv[2] else "translate" # "translate" or "transcribe"
file_transcript_name = sys.argv[3]

# model_type = "tiny"
# model_type = "base"
# model_type = "small"
model_type = "medium"
# model_type = "large"

model = whisper.load_model(model_type)
result = model.transcribe(audio=sys.argv[1], language="pt", task=task)

with open(file_transcript_name, 'w') as json_file:
    json.dump(result, json_file, indent=4)
