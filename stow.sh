#!/usr/bin/env bash

init_pwd="$(pwd)"

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

# create symlinks
cd /usr/local/bin
sudo ln -sf "$HOME/projects/tools/php-cs-fixer/vendor/bin/php-cs-fixer" php-cs-fixer
sudo ln -sf "$HOME/projects/tools/phpactor/bin/phpactor" phpactor
sudo ln -sf "$HOME/projects/tools/rofi-pass/rofi-pass" rofi-pass
sudo ln -sf "$HOME/bash-scripts/yt/yt-download.sh" ytdv
sudo ln -sf "$HOME/bash-scripts/yt/ll-download.sh" ytll
sudo ln -sf "$HOME/projects/tools/ff2mpv/ff2mpv.py" ff2mpv

cd "$init_pwd"
