#!/usr/bin/env bash

# removing all current symlinks/files
find . | grep -v '.git' | grep ".config/" | sed "s|.*\(\.config.*\)|$HOME/\1|g" | xargs rm -rf

# stowing everything from this directory
ls -I 'README.md|stow.sh|fcrontab' | xargs stow -v
