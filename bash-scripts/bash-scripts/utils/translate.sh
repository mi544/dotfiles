#!/usr/bin/env bash

tr_table=$(cat "$(dirname "$0")/$1.table")

sleep 0.2
xdotool key ctrl+x
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
xdotool key ctrl+v
