#!/bin/sh

#landscape (normal)
xmodmap -e "keycode 113 = Left"
xmodmap -e "keycode 114 = Right"
xmodmap -e "keycode 116 = Down"
xmodmap -e "keycode 111 = Up"
xmodmap -e "keycode 104 = KP_Enter"
xmodmap -e "keycode 86 = KP_Add"

xrandr -o normal
xinput set-prop 12 --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0

