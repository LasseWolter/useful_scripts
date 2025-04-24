#!/bin/bash
# Deletes all g-calender events found by search function
# On a different monitor setup the (x,y) coordinate (2793, 220) needs to be updated
echo $1
for ((i=1; i<=$1; i++)) do
    xdotool mousemove 2793 220 click --delay 1000 --repeat 2 1 &
    sleep 2 
done

