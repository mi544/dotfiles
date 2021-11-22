#!/usr/bin/env bash

filename_no_ext="$1"
filename="$1"'.tar.gz'
files_to_backup=$(echo $(cat ./backup.list | sed 's#^\(.*\)$#'"$HOME"'/\1#'))

mkdir "$HOME/Backups" -p

tar caf "$HOME/Backups/$filename" $files_to_backup && \
sha256sum "$HOME/Backups/$filename" |
  awk '{print $1}' > \
  "$HOME/Backups/$filename_no_ext.sha256"
