#!/bin/sh

#portrait (left)

Xmodmap -e "keycode 113 = j"
xmodmap -e "keycode 114 = k"
xmodmap -e "keycode 104 = j"
xmodmap -e "keycode 86 = k"
xmodmap -e "keycode 116 = Left"
xmodmap -e "keycode 111 = Right"
xrandr -o right
xinput set-prop 12 --type=float "Coordinate Transformation Matrix" 0 1 -1 -1 0 0 0 0 1
