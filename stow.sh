#!/usr/bin/env bash

init_pwd="$(pwd)"

# removing all current symlinks/files
#tbd

# cd into dotfiles directory
cd "$(dirname $0)"

# stow user folders
find . -maxdepth 1 -type d | \
  tail -n +2 | \
  perl -pe 's#^./##' | \
  rg -v '^.git$|^_udev$|^_xorg$|^_systemd-units$' | \
  xargs stow -v

# stow / folders
sudo stow --target=/ _xorg
sudo stow --target=/ _udev
sudo stow --target=/ _systemd-units

# create symlinks
sudo mkdir -p /usr/local/bin
cd /usr/local/bin
sudo ln -sf "$HOME/projects/tools/php-cs-fixer/vendor/bin/php-cs-fixer" php-cs-fixer
sudo ln -sf "$HOME/projects/tools/phpactor/bin/phpactor" phpactor
sudo ln -sf "$HOME/projects/tools/rofi-pass/rofi-pass" rofi-pass
sudo ln -sf "$HOME/bash-scripts/yt/yt-download.sh" ytdv
sudo ln -sf "$HOME/bash-scripts/yt/ll-download.sh" ytll
sudo ln -sf "$HOME/bash-scripts/yt/ytmpv.sh" vv
sudo ln -sf "$HOME/projects/tools/ff2mpv/ff2mpv.py" ff2mpv

cd "$init_pwd"
