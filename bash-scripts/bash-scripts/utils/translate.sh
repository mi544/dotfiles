#!/usr/bin/env bash

tr_lang=$1
tr_mode=$2

tr_table=$(cat "$(dirname "$0")/$tr_lang.table")

sleep 0.2
if [[ "$tr_mode" == "all" ]]; then
    xdotool key ctrl+a
    sleep 0.5
    xdotool key ctrl+x
elif [[ "$tr_mode" == "vim" ]]; then
    sleep 0.5
    xdotool key quotedbl+plus
    sleep 0.1
    xdotool key y
    sleep 0.2
    xdotool key g+v
    sleep 0.1
    xdotool key d
else
    xdotool key ctrl+x
fi

contents=$(xclip -o -selection clipboard)
contents_tr=$contents

for char_pair in $tr_table
do
    char_orig=$(echo -n "$char_pair" | awk -F ':' '{print $1}')
    char_tr=$(echo -n "$char_pair" | awk -F ':' '{print $2}')
    contents_tr=$(echo -n "$contents_tr" |
        sed "s%$char_orig%$char_tr%g"
    )
done

echo -n "$contents_tr" | xclip -selection clipboard

if [[ "$tr_mode" == "vim" ]]; then
    xdotool key quotedbl+plus+p
else
    xdotool key ctrl+v
fi

