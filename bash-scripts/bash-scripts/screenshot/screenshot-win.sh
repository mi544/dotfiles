#!/usr/bin/env bash

screenshot_path="$HOME/Share/$(date +%s).png"
count=0

# the following loop tackles the issue of having 2+ screenshots taken
# within the same unix timestamp (=> within the same second)
# it includes logic for taking a screenshot the first time - doing nothing,
# the second time - adding on "_${count}" to the end of the filename,
# the third time - incrementing the "$count" up in the "_${count}" logic
while :; do
    count=$(( count + 1 ))
    next_screenshot_path=$(echo "$screenshot_path" | sed "s#.png#_${count}.png#i")
    if [[ -f $next_screenshot_path ]]; then
        continue
    fi
    if [[ -f $screenshot_path ]]; then
        screenshot_path="$next_screenshot_path"
        break
    fi
    break
done

# taking a screenshot of the focused window
scrot --silent --focused --file "$screenshot_path"
# copying it into clipboard
xclip -t image/png -selection clipboard "$screenshot_path" 
# copying it into 'Keepy' for archiving purposes;
# assuming that 'Share' is cleaned up frequently
cp "$screenshot_path" "$HOME/Share/Keepy/$(basename "$screenshot_path")"
