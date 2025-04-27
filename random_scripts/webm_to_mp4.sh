#!/bin/bash
# Use ffmpeg to convert .webm video to .mp4 video

ffmpeg -i $1.webm -vf scale=1920x1170 $1.mp4
