#!/usr/bin/env bash

ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0+0,0 "$HOME/Capture/$(date +%s).mp4"
