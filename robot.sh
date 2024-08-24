#!/bin/bash

EXIT_DIR="result/"
PATH_INPUT_VIDEO="$1" # It must be .mp4
AUDIO_NAME="audio.wav"
TRANSCRIPT_NAME="transcript.txt"
AUDIO_TRANSLATED_NAME="output.wav"
VIDEO_RESULT="result.mp4"
PATH_TRANSCRIPT_TEXT="$EXIT_DIR$TRANSCRIPT_NAME"
PATH_ORIGINAL_AUDIO="$EXIT_DIR$AUDIO_NAME"
PATH_AUDIO_TRANSLATED="$EXIT_DIR$AUDIO_TRANSLATED_NAME"
PATH_VIDEO_RESULT="$EXIT_DIR$VIDEO_RESULT"
PATH_VIDEO_RESULT_WITHOUT_LIPSINC="${EXIT_DIR}result_without_lipsinc.mp4"

# In line below you put the folow options:
# 1 - To create a video with lipsync.
# 2 - To Create a video without lipsync.
# 0 - To not create any video.
WITH_LIPSINC=0

function validate_input () {
    if [ -z $1 ]; then
        echo "You need to pass the .mp4 target."
        exit 1
    fi
}

function validate_input_file_exist () {
    if [ -a $1 ]; then
        echo "We find the .mp4 file.  [ $1 ]"
    else
        echo "Target file donot exist."
        exit 1
    fi
}

function validate_error_in_last_comand () {
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

function remove_audio_from_video () {
    date
    echo "Removing audio from video..."
    ffmpeg -i "$PATH_INPUT_VIDEO" -ab 160k -ac 2 -ar 44100 -vn "$PATH_ORIGINAL_AUDIO"
    validate_error_in_last_comand
}

function translate_audio_to_english_and_transcript () {
    date
    echo "Translating audio to english and transcripting to text..."
    python translate_transcript.py "$PATH_ORIGINAL_AUDIO" > "$PATH_TRANSCRIPT_TEXT"
    validate_error_in_last_comand
}

function genetate_voice_by_transcript () {
    date
    echo "Genetating voice..."
    cd TTS
    python voice_generator2.py   \
        "../$PATH_ORIGINAL_AUDIO"  \
        "../$PATH_TRANSCRIPT_TEXT" \
        "../$PATH_AUDIO_TRANSLATED"
    cd ..
    validate_error_in_last_comand
}

function create_video_with_lipsinc () {
    date
    echo "Building video with lipsync..."
    cd Wav2Lip
        # --checkpoint_path checkpoints/wav2lip.pth \
        # --checkpoint_path checkpoints/lipsync_expert.pth \
        # --checkpoint_path checkpoints/visual_quality_disc.pth \
    python3 inference.py \
        --checkpoint_path checkpoints/wav2lip_gan.pth \
        --face "../$PATH_INPUT_VIDEO" \
        --audio "../$PATH_AUDIO_TRANSLATED" \
        --outfile "../$PATH_VIDEO_RESULT" \
        --resize_factor 2
    cd ..
}

function create_video_with_new_audio_without_lipsinc () {
    date
    echo "Building video without lipsync..."
    cd MoviePy
    python main.py \
        "../$PATH_INPUT_VIDEO" \
        "../$PATH_AUDIO_TRANSLATED" \
        "../$PATH_VIDEO_RESULT_WITHOUT_LIPSINC"
    cd ..
}

# for arquivo in /caminho/para/diretorio/*; do
#   echo "Processando $arquivo"
# done

# exit 1

validate_input $1
validate_input_file_exist $1

echo "Starting process..."

remove_audio_from_video

translate_audio_to_english_and_transcript

genetate_voice_by_transcript

if [ $WITH_LIPSINC -eq 1 ]; then
    create_video_with_lipsinc
elif [ $WITH_LIPSINC -eq 2 ]; then
    create_video_with_new_audio_without_lipsinc
else
    exit
fi

echo "Process finish!!!"