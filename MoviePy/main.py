from moviepy.editor import VideoFileClip, AudioFileClip
import sys

input_video = sys.argv[1]
input_audio = sys.argv[2]
output_video = sys.argv[3]

print ("input_video "+input_video)
print ("input_audio "+input_audio)
print ("output_video "+output_video)

# Search video and audio input
video = VideoFileClip(input_video)
new_audio = AudioFileClip(input_audio)

# Change video audio to new audio
video = video.set_audio(new_audio)

# Export video with new audio
video.write_videofile(output_video, codec="libx264", audio_codec="aac")
