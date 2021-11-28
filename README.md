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
jack2 lib32-jack2 jack2-dbus pulseaudio-jack realtime-privileges
grub efibootmgr
pamixer pavucontrol
```

```
adduser -m ..
groupadd docker
usermod -aG wheel,audio,realtime,video,storage,docker ..
visudo
```

!!!
CAPTURE /etc/default/grub
CAPTURE symlinks in `/usr/local/bin`
CAPTURE xinit setup
CAPTURE `/etc/pacman.conf`
systemctl enable NetworkManager
systemctl enable bluetooth
xdg-mime default librewolf.desktop x-scheme-handler/http
!!!


Uncomment lib32 in pacman.conf

```
--aura---
xf86-video-amdgpu mesa lib32-mesa lib32-vulkan-radeon vulkan-radeon
alacritty xorg-server xorg-xinit xorg-apps xclip xdo bspwm sxhkd rofi nitrogen unclutter
AUR:polybar picom-git st
```

Terminal:
```
alacritty
broot
exa
asciiquarium
bash-completion
cmatrix
cool-retro-term
figlet
htop
zenith
lolcat
man-db
man-pages
neofetch
screenfetch
tldr
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
AUR:airshipper
AUR:hmcl-bin
```

WM:
```
```

Utils:
```
curl
wget
AUR:aria2-fast
lshw
ffmpeg
xdg-user-dirs xdg-utils perl-file-mimeinfo
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
fcitx5 fcitx5-anthy fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-nord fcitx5-table-other
AUR:gammy-git
ripgrep
pass pass-otp
AUR:youtube-dl-git yt-dlp-git phantomjs-bin
AUR:qimgv
zathura zathura-pdf-mupdf
rustup
screenkey
stow
xdg-user-dirs (and the wiki - th esetup part as well!)
gamemode
jq
```

Apps:
```
AUR:librewolf-bin
AUR:insomnia-bin
AUR:reaper-bin
AUR:rustdesk-bin
AUR:zoom
AUR:deadbeef
discord
gimp
obs-studio
qbittorrent
steam
telegram-desktop
vlc
thunar thunar-archive-plugin thunar-volman gvfs raw-thumbnailer ffmpegthumbnailer tumbler thunar-media-tags-plugin
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
otf-ipafont ttf-hanazono
```

Potentially(?):
```
dvd+rw-tools
nautilus
terminus-font
```

TBD: alsa, pulse (with mixers), bluez, networkmanager, wine,
intel video (installation), japanese fonts

steam settings preserve
add Auto power-on after boot and other processes related to setting up bluetooth
https://wiki.archlinux.org/title/Bluetooth#Auto_power-on_after_boot

archivers list packages
