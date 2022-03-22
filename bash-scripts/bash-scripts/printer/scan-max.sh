#!/usr/bin/env bash

scan_path="$HOME/Scan/Scan_$(date +"%Y-%m-%d_%k-%M-%S")_1200.png"
echo 'Scanning at 1200dpi, may take a while...'
scanimage --dont-scan; scanimage \
    --progress \
    --resolution=1200 \
    --format=png \
    --output-file="$scan_path"
echo 'Scanning complete.'
