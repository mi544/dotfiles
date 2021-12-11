#!/usr/bin/env bash

cd "$HOME/Capture"
aria2c -c -s 12 -x 12 -k 10M -j 1 "$(xclip -o -selection clipboard)"
