#!/usr/bin/env bash

filename="$(date +%s).tar.gz"
files_to_backup=$(echo $(cat ./backup.list | sed 's#^\(.*\)$#'"$HOME"'/\1#'))

mkdir "$HOME/Backups" -p

tar cafv "$HOME/Backups/$filename" $files_to_backup && \
sha256sum "$HOME/Backups/$filename" > "$HOME/Backups/$filename.sha256" && \
gpg -b "$HOME/Backups/$filename.sha256"
