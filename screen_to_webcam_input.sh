#!/bin/bash
# This command captures the current screen using x11grab and then streams it to a virtual cam using v4l2loopback

#SOURCES:
# 1) https://superuser.com/questions/411897/using-desktop-as-fake-webcam-on-linux  
# 2) https://theterminallife.com/using-ffmpeg-and-v4l2-loopback-to-play-youtube-videos-as-a-webcam/


# CREATE VIDEO DEVICE THAT SIMULATES A WEBCAM
# 1) Check which video devices are available before running that command using 'll /dev/video*'
# 2) Create new video device with 'modprobe v4l2loopback'

# /dev/video1 might need to be changed to the video device created with 'modprobe v4l2loopback'
# -s flag stands for the resolution and should be adjusted accordingly
ffmpeg -f x11grab -r 15 -s 1280x720 -i :0.0+0,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0
