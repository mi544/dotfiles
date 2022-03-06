#!/usr/bin/env bash

if ! [[ -z $(wmctrl -l | rg -i zoom) ]]; then
    exit 0
fi

for ps in $(ps aux | rg -i zoom | rg -vi rg | awk '{print $2}'); do
    >/dev/null 2>&1 kill -9 $ps
done
