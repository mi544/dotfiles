# dotfiles

## GNU Stow

Use [GNU Stow](https://www.gnu.org/software/stow/) to load configuration for
each package.

To stow individual packages
```bash
stow <package>
# for example
stow nvim
```

A script that automatically removes existing destination files and stows all
the packages automatically is in the works.

## Node

Node versioning and global npm package management is handled through
[Volta](https://volta.sh/)  

Run `volta install` with the following arguments

```
node@lts
npm-check-updates serve lerna
eslint eslint_d prettier
typescript typescript-language-server vls bash-language-server
```

## Packages to install (WIP)

Installation:
```
base base-devel bash-completion
linux linux-headers linux-firmware linux-zen linux-zen-headers amd-ucode 
man-db man-pages vim sudo git
networkmanager networkmanager-openvpn
bluez bluez-utils
pipewire pipewire-docs pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire lib32-pipewire-jack wireplumber helvum gst-plugin-pipewire
grub efibootmgr
pamixer pavucontrol
```

```
adduser -m ..
groupadd docker
usermod -aG wheel,audio,realtime,video,storage,docker,libvirt ..
visudo
```

!!!
CAPTURE /etc/default/grub
CAPTURE symlinks in `/usr/local/bin`
CAPTURE xinit setup
CAPTURE `/etc/pacman.conf`
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable fcron
systemctl enable ntpd
xdg-mime default librewolf.desktop x-scheme-handler/http
!!!


Uncomment lib32 in pacman.conf

```
--aura---
xorg-server xorg-xinit xorg-apps xclip xdo xdotool
xf86-video-amdgpu mesa lib32-mesa lib32-vulkan-radeon vulkan-radeon
bspwm sxhkd rofi nitrogen unclutter
AUR:polybar picom-git
```

Terminal:
```
alacritty
exa
asciiquarium
cmatrix
cool-retro-term
asciinema
figlet
htop
lolcat
neofetch
tldr
```

Games:
```
aisleriot
gnuchess knights gnome-chess
steam
AUR:protonup-git
lutris
ppsspp
mgba-qt
AUR:rpcs3-bin
AUR:spacecadetpinball-git
AUR:yuzu-mainline-bin
AUR:airshipper
AUR:hmcl-bin
```

Utils:
```
libvirt qemu iptables-nft dnsmasq bridge-utils virt-manager python python-pip
AUR:libspeedhack-git
libqalculate
archiso
asciinema
fcron
reflector
exiv2
curl wget
ntp
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
composer
docker docker-compose docker-machine
fcitx5 fcitx5-anthy fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-nord fcitx5-table-other
AUR:gammy-git
ripgrep
pass pass-otp
AUR:youtube-dl-git yt-dlp-git phantomjs-bin
AUR:gallery-dl-git
AUR:qimgv-git
zathura zathura-pdf-mupdf
rustup
python
screenkey
stow
xdg-user-dirs (and the wiki - th esetup part as well!)
gamemode
jq tidy
AUR:pup-git fq
maria-db
AUR:xwinwrap-git
```

Apps:
```
kate
filelight
AUR:font-manager-git
AUR:librewolf-bin
AUR:insomnia-bin
AUR:reaper-bin
AUR:rustdesk-bin
AUR:zoom
AUR:deadbeef
discord
inkscape
aegisub
gimp
obs-studio
qbittorrent
steam
telegram-desktop
vlc
thunar thunar-archive-plugin thunar-volman gvfs raw-thumbnailer ffmpegthumbnailer tumbler thunar-media-tags-plugin
dbeaver
dino
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
libvirt setup (enabling services?)
add Auto power-on after boot and other processes related to setting up bluetooth
https://wiki.archlinux.org/title/Bluetooth#Auto_power-on_after_boot

maria-db post install process

archivers list packages
set XDG vars

```
xdg-mime default org.pwmt.zathura.desktop application/pdf
```
java



nmap dnsutils whois stunnel hping openbsd-netcat
pip install python-lsp-server
pip install 'python-lsp-server[all]'

```
rustup install stable
rustup component add rls rust-analysis rust-src
```

capture vim lsp packages into 1 category
