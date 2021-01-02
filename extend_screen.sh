#!/bin/bash
# Simple script to turn on second screen connected over DP and 
# arrange them according to my current setup
# For a different setup --ouputs and --pos arguments will likely have to be changed
xrandr --output DP2-8 --pos 1920x0 --auto 
xrandr --output DP3-1 --pos 0x120 --auto 

# The extension kinda throws up plasmashell sometimes, so we just restart it
# once the extension is done
plasmashell --replace &
