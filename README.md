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

```
npm-check-updates serve lerna
eslint eslint_d prettier
typescript typescript-language-server vls bash-language-server
```

## Packages to install (WIP)

Installation:
```
base base-devel linux linux-firmware linux-zen man-db man-pages vim amd-ucode sudo git
networkmanager networkmanager-openvpn bluez bluez-utils alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer
grub efibootmgr
pamixer pavucontrol
```

```
adduser -m ..
groupadd docker
usermod -aG wheel,audio,video,storage,docker ..
visudo
```

!!!
CAPTURE /etc/default/grub
CAPTURE symlinks in `/usr/local/bin`
CAPTURE xinit setup
CAPTURE `/etc/pacman.conf`
systemctl enable NetworkManager
systemctl enable bluetooth
!!!


Uncomment lib32 in pacman.conf

```
--aura---
xf86-video-amdgpu mesa lib32-mesa lib32-vulkan-radeon vulkan-radeon
alacritty xorg-server xorg-xinit xorg-apps xclip xdo bspwm sxhkd rofi nitrogen unclutter
AUR:polybar picom-git st
```

??
xdg-user-dirs 
??

Terminal:
```
alacritty
asciiquarium
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
AUR:sl
```

Games:
```
aisleriot
gnuchess gnome-chess
steam
lutris
ppsspp
AUR:rpcs3-bin
AUR:spacecadetpinball-git
AUR:yuzu-mainline-bin
```

WM:
```
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
AUR:volta-bin
ufw
archlinux-java-run(?)
composer
docker docker-compose docker-machine
fcitx5 fcitx5-anthy fcitx5-configtool fcitx5-gtk fcitx5-qt
AUR:gammy-git
ripgrep
pass pass-otp
youtube-dl
AUR:youtube-dl-git yt-dlp-git phantomjs-bin
AUR:qimgv
zathura zathura-pdf-mupdf
rustup
screenkey
stow
xdg-user-dirs (and the wiki - th esetup part as well!)
```

Apps:
```
AUR:librewolf-bin
AUR:insomnia-bin
AUR:rustdesk-bin
AUR:zoom
AUR:deadbeef
AUR:slack-desktop
discord
gimp
obs-studio
qbittorrent
steam
telegram-desktop
vlc
thunar thunar-archive-plugin thunar-volman gvfs
audacity
dbeaver
dino
gedit
irssi
libreoffice-fresh
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

feral gamemode
steam settings preserve
