#!/bin/bash
# Command taken from:
# https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg
echo "--------------------------------------------------"
echo "Creating compressed version of $1 with new name $2"
echo "--------------------------------------------------"
ffmpeg -i $1 -vcodec libx265 -crf 28 $2 
