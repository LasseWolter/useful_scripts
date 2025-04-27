#!/bin/bash
# This command captures the current screen using x11grab and then streams it to a virtual cam using v4l2loopback

#SOURCES:
# 1) https://superuser.com/questions/411897/using-desktop-as-fake-webcam-on-linux  
# 2) https://theterminallife.com/using-ffmpeg-and-v4l2-loopback-to-play-youtube-videos-as-a-webcam/


# CREATE VIDEO DEVICE THAT SIMULATES A WEBCAM
# 1) Check which video devices are available before running that command using 'll /dev/video*'
# 2) Create new video device with 'modprobe v4l2loopback'

# Create dummy video device if none exists
# We assume that no other video device is registered - this might need to be changed
# in that case /dev/video0 needs to be replaced with /dev/videoN
FILE=/dev/video0
echo $FILE
if [ ! -e "$FILE" ]; then
    echo "$FILE does not exist.."
    echo "Creating new dummy video device..."
    sudo modprobe v4l2loopback
fi

# /dev/videoN might need to be changed to the video device created with 'modprobe v4l2loopback'
# -s flag stands for the resolution and should be adjusted accordingly
# -i :0.0+x,y stands for the offset and might need to be adjusted accordingly 
ffmpeg -f x11grab -r 40 -s 1920x1080 -i :0.0+1280,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0
