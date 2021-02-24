#!/bin/bash
# This adds a new resolution mode suitable for the netbook resolution (1368x768)
# It then adds and applies it to the DP-1 output - this might need to be changed to suit a different setup
# If you want to do this for a different resolution and FPS run "gtf 1024 600 60" with changed values and copy the corresponding output 
xrandr --newmode "1024x600_60.00"  48.96  1024 1064 1168 1312  600 601 604 622  -HSync +Vsync
xrandr --addmode DP-1 "1024x600_60.00" 
xrandr --output DP-1 --mode "1024x600_60.00"

# Example for 1368x768 at 60FPS
# xrandr --newmode "1368x768_60.00"  85.86  1368 1440 1584 1800  768 769 772 795  -HSync +Vsync
# xrandr --addmode DP-1 "1368x768_60.00"
# xrandr --output DP-1 --mode "1368x768_60.00"

