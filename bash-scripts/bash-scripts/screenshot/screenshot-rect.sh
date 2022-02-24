#!/usr/bin/env bash

screenshot_path="$HOME/Share/$(date +%s).png"
count=0

if [[ -f $screenshot_path ]]; then
    screenshot_path=$(echo "$screenshot_path" | sed "s#.png#_1.png#i")
fi

scrot --silent --select --file "$screenshot_path" &&
    xclip -t image/png -selection clipboard "$screenshot_path" 
