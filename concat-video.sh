#!/bin/bash

RELATIVE_PATH="/Users/yurimarcon/Documents/Udemy/Curso_vue/Vídeos/En-Sessao-2/"
INPUT_VIDEO_1="$RELATIVE_PATH"2.10-1-cap.mp4
INPUT_VIDEO_2="$RELATIVE_PATH"2.10-2-cap.mp4
OUTPUT_VIDEO="$RELATIVE_PATH"2.10-Create_dialogs.mp4

ffmpeg \
    -i "$INPUT_VIDEO_1" \
    -i "$INPUT_VIDEO_2" \
    -filter_complex "[0:v][0:a][1:v][1:a]concat=n=2:v=1:a=1[outv][outa]" \
    -map "[outv]" \
    -map "[outa]" "$OUTPUT_VIDEO"