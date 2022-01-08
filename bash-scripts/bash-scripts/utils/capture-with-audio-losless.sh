#!/usr/bin/env bash

audio_source_id=$1
if [ -z "$audio_source_id" ]; then
    audio_source_id=$(pactl list sinks short | rg 'RUNNING' | awk '{print $1}')
fi

ffmpeg -y \
    -thread_queue_size 300 -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 \
    -thread_queue_size 8 -f pulse -ac 2 -i $audio_source_id \
    -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 \
    "$HOME/Capture/$(date +%s).mp4"
