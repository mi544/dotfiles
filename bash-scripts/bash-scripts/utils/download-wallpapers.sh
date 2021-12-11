#!/usr/bin/env bash

sleep 2
for i in {1..70}; do
    sleep 0.3
    xdotool mousemove 1808 106
    sleep 0.1
    xdotool click 1
    sleep 0.8
    "$HOME/bash-scripts/utils/download-xclip.sh" > /dev/null &
    xdotool key Control_L+Tab
done
