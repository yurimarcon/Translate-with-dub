#!/bin/bash

RELATIVE_PATH="/Users/yurimarcon/Documents/Udemy/Curso_vue/Vídeos/En-Sessao-3/"
INPUT_FILE_NAME="3-Composition_x_option.mp4"
INPUT_VIDEO="${RELATIVE_PATH}${INPUT_FILE_NAME}"
OUTPUT_VIDEO_PART1="${RELATIVE_PATH}3-1.mp4"
OUTPUT_VIDEO_PART2="${RELATIVE_PATH}3-2.mp4"

ffmpeg -i "$INPUT_VIDEO" -ss 00:00:00 -to 00:04:59 -c copy ${OUTPUT_VIDEO_PART1}
ffmpeg -i "$INPUT_VIDEO" -ss 00:04:59 -c copy ${OUTPUT_VIDEO_PART2}

# OUTPUT_VIDEO_PART3="${RELATIVE_PATH}2.14-3.mp4"

# ffmpeg -i "$INPUT_VIDEO" -ss 00:00:00 -to 00:04:59 -c copy ${OUTPUT_VIDEO_PART1}
# ffmpeg -i "$INPUT_VIDEO" -ss 00:04:59 -to 00:09:58 -c copy ${OUTPUT_VIDEO_PART2}
# ffmpeg -i "$INPUT_VIDEO" -ss 00:09:58 -c copy ${OUTPUT_VIDEO_PART3}
