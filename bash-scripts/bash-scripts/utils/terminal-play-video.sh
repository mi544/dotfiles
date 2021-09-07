#!/usr/bin/env bash

# ./this-file.sh <file_name>

alacritty --class video -o "font.size=3" -e \
  mplayer -really-quiet -loop 0 -vo caca $HOME/term/$1.mp4
