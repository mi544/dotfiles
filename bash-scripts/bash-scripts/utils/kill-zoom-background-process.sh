#!/usr/bin/env bash

# this script unloads processes (zoom) that are running in the background

# if zoom has windows open, exit
if ! [[ -z $(wmctrl -l | rg -i zoom) ]]; then
    exit 0
fi

# otherwise it's running in the background
# and can be unloaded
for pid in $(ps aux | rg -i '(/usr/bin/zoom)|(/opt/zoom/zoom)' | rg -v 'rg -i' | awk '{print $2}'); do
    >/dev/null 2>&1 kill -9 $pid
done
