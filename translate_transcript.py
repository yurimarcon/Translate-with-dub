import whisper
import sys
import json

input_audio = sys.argv[1]
task = sys.argv[2] if sys.argv[2] else "translate" # "translate" or "transcribe"
file_transcript_name = sys.argv[3]
source_lang=sys.argv[4]
dest_language=sys.argv[5]

model_type = "tiny"
# model_type = "base"
# model_type = "small"
# model_type = "medium"
# model_type = "large"

model = whisper.load_model(model_type)

result = model.transcribe(
    audio=input_audio, 
    language=source_lang, 
    task=task,
    condition_on_previous_text=True,
    fp16=True,
    no_speech_threshold=0.1,
    compression_ratio_threshold=2.4,
    logprob_threshold=-1.0,
    temperature=0.1,
    beam_size=5,
    best_of=3,
    verbose=True
)

with open(file_transcript_name, 'w') as json_file:
    json.dump(result, json_file, indent=4)
