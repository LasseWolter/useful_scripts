#!/bin/bash

# The following command starts a vlc stream and stores it at /home/lasse/Music/test.mp4
# It uses the following settings (which might be adjusted): 
#    - video input: /dev/video0  (tested using droidcam)
#    - audio input: alse://default
#    - video codec: h264
#    - audio codec: acc
#       -> these codec settings (h264/aac) were chosen to work well with WhatsApp

vlc v4l2:///dev/video0 :input-slave=alsa://default :live-caching=300 --sout "#transcode{vcodec=h264,acodec=aac,ab=128,channels=2,samplerate=44100,scodec=none}:file{dst=/home/lasse/Music/test.mp4,no-overwrite}"

# It might be useful to adjust the alsamixer settings to improve audio quality
# For that the following 3 commands are helpful
#     - alsamixer: for adjusting the actual settings 
#     - sudo alsactl --file ~/.config/asound.state store: for storing alsamixer settings (file can be adjusted)
#     - sudo alsactl --file ~/.config/asound.state store: for restoring alsamixer settings
