#!/usr/bin/env bash

audio_source_id=$1

ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i $audio_source_id "$HOME/Capture/$(date +%s).mp4"
