#!/usr/bin/env bash

scan_path="$HOME/Scan/Scan_$(date +"%Y-%m-%d_%k-%M-%S").png"
echo 'Scanning at 300dpi...'
2> scanimage --dont-scan; scanimage \
    --progress \
    --resolution=300 \
    --format=png \
    --output-file="$scan_path"
echo 'Scanning complete.'
