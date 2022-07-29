#!/usr/bin/env bash

direction="$1"
wp_list_path="$HOME/.config/wallpapers.list"

if ! [ -e "$wp_list_path" ]; then
    "$(dirname "$0")/generate-random-wallpaper-list.sh"
fi

wp_total=$(sed '1q;d' "$wp_list_path")
wp_current=$(sed '2q;d' "$wp_list_path")
line_num=$(( wp_current + 2))

if [ "$direction" = 'prev' ]; then 
    if [[ $wp_current -le 1 ]]; then
        nitrogen --restore
        exit 0
    fi
    line_num_next=$(( wp_current - 1 ))
elif [ "$direction" = 'next' ]; then
    if [[ $wp_current -ge $wp_total ]]; then
        nitrogen --restore
        exit 0
    fi
    line_num_next=$(( wp_current + 1 ))
else
    line_num_next=$wp_current
fi

wp_path=$(sed "${line_num}q;d" "$wp_list_path")
wallpaper="$($(dirname "$0")/generate-compatible-image.sh $wp_path)"
sed -i "2s/.*/${line_num_next}/" "$wp_list_path"
nitrogen --set-zoom --save "$wallpaper"
