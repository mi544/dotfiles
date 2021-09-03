# dotfiles

## GNU Stow

Use [GNU Stow](https://www.gnu.org/software/stow/) to load configuration for
each package.

To stow individual packages
```shell
$ stow <package>
# for example
$ stow nvim
```

Or run the `stow.sh` script to remove and stow all packages. All existing files
that stow will operate on will be removed from `$HOME/.config` before stowing

## Node

Node versioning is handled through [Volta](https://volta.sh/)  

Here's a list of packages needed to be installed:

```
npm-check-updates serve netlify-cli
lerna
eslint eslint_d prettier
typescript typescript-language-server vls
```

## Packages to install (WIP)

Installation:
```
intel-ucode
```

Terminal:
```
alacritty
asciiquarium
asciidoc
bash-completion
cmatrix
cool-retro-term
figlet
htop
lolcat
man-db
man-pages
neofetch
screenfetch
tldr
```

WM:

```
bspwm
rofi

```

Utils:
```
curl
wget
ffmpeg
gnome-screenshot
go
imagemagick
iputils
lua
volta
ufw
```

Apps:
```
discord
firefox
firefox-developer-edition
gimp
insomnia-bin
obs-studio
qbittorrent
rustdesk-bin
slack-desktop
steam
telegram-desktop
vlc
zoom-system-qt
```

Fonts:
```
gnu-free-fonts
```

Potentially(?):
```
dvd+rw-tools
nautilus
terminus-font
```

TBD: alsa, pulse (with mixers), bluez, networkmanager, wine,
intel video (installation), japanese fonts
