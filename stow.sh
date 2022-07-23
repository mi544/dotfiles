#!/usr/bin/env bash

# removing all current symlinks/files
# tbd

# cd into dotfiles directory
cd "$(dirname $0)"

# stow user folders
find . -maxdepth 1 -type d | \
  tail -n +2 | \
  rg -v 'bin$|.git$' | \
  perl -pe 's#./##' | \
  xargs stow -v

# stowing root folders
sudo stow --target=/ bin
