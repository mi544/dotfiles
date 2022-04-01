# dotfiles
## GNU Stow
Use [GNU Stow](https://www.gnu.org/software/stow/) to load configuration for
each package

To stow individual packages
```bash
stow <package>
# for example
stow nvim
```

A script that automatically removes existing destination files and stows all
the packages automatically is in the works.

---

## TODO
!!!
CAPTURE symlinks in `/usr/local/bin`
CAPTURE /etc/default/grub
CAPTURE xinit setup
CAPTURE `/etc/pacman.conf`
capture vim lsp packages into 1 category
!!!

## Environment
### Node
Node versioning and global npm package management is handled through
[Volta](https://volta.sh/)  

- Install `aur/volta-bin`
- Run `volta install` with the following arguments:

```bash
volta install node@lts yarn remark-cli remark-lint remark-toc remark-preset-lint-consistent remark-preset-lint-recommended remark-preset-lint-markdown-style-guide npm-check-updates serve lerna @nestjs/cli eslint eslint_d prettier typescript typescript-language-server vls bash-language-server express-generator
```

```
node@lts yarn
remark-cli remark-lint remark-toc remark-preset-lint-consistent remark-preset-lint-recommended remark-preset-lint-markdown-style-guide
npm-check-updates serve lerna @nestjs/cli
eslint eslint_d prettier
typescript typescript-language-server vls bash-language-server
express-generator
```

### PHP
```
composer global require psy/psysh:@stable
```

### Python
`nmap dnsutils whois stunnel hping openbsd-netcat`
pip install python-lsp-server
pip install 'python-lsp-server[all]'

### Rust
```
rustup install stable
rustup component add rls rust-analysis rust-src
```

## Backup
Files to back up:
```
TBD
```

## Packages to install (WIP)
### Installation & Setup
```
base base-devel bash-completion pacman-contrib
linux linux-headers linux-firmware linux-zen linux-zen-headers amd-ucode 
man-db man-pages vim sudo git
networkmanager networkmanager-openvpn
bluez bluez-utils
pipewire pipewire-docs pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire lib32-pipewire-jack wireplumber helvum gst-plugin-pipewire
grub efibootmgr
pamixer pavucontrol
```

```
adduser -m mi
groupadd docker
usermod -aG wheel,audio,realtime,video,storage,docker,libvirt mi
visudo
```

```
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable fcron
systemctl enable ntpd
systemctl enable cups
systemctl disable systemd-resolved
systemctl enable avahi-daemon
```

```
# Uncomment lib32 in pacman.conf
```

### Basic System Tools, Graphics, Desktop
```
aur/aura-bin
xorg-server xorg-xinit xorg-apps xclip xdo xdotool wmctrl
xf86-video-amdgpu mesa lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader vulkan-radeon lib32-vulkan-radeon
bspwm sxhkd nitrogen unclutter
aur/polybar aur/picom-git aurrofi-git
aur/neovim-git aur/neovim-plug-git aur/efm-langserver-git
```

### Fonts
```
gnu-free-fonts
otf-ipafont ttf-hanazono
aur/ttf-dejavu-ib aur/ttf-nunito aur/ttf-nunito-sans
```

### Games
#### Native
```
aisleriot gnuchess knights gnome-chess aur/spacecadetpinball-git
```
#### Clients
```
steam aur/protonup-git
aur/airshipper
aur/hmcl-bin
```
#### Emulators
```
ppsspp mgba-qt aur/rpcs3-bin aur/yuzu-mainline-bin
```

### Apps
#### Photo
```
imagemagick
gimp
inkscape
```
#### Video
```
obs-studio
vlc
```
#### Audio
```
aur/audacium-git aur/reaper-bin
aur/deadbeef
```
#### Communication
```
aur/dino-git
aur/zoom
discord
telegram-desktop
irssi
```
#### System
```
aur/alacritty-git
thunar thunar-archive-plugin thunar-volman gvfs raw-thumbnailer ffmpegthumbnailer tumbler thunar-media-tags-plugin
filelight
aur/font-manager-git
aur/eaglemode
aur/openrgb-bin
aur/librewolf-bin
qbittorrent
libreoffice-fresh
```

#### Other
```
aur/insomnia-bin
aur/rustdesk-bin
aegisub
dbeaver
```

### Utils
### Terminal
```
neofetch
exa
asciinema
cool-retro-term
cmatrix figlet lolcat asciiquarium
aur/tealdeer-git
```

```
cups cups-pdf avahi nss-mdns
sane sane-airscan
wine-staging wine-gecko wine-mono lib32-libpulse lib32-openal
aur/winetricks-git
libvirt qemu iptables-nft dnsmasq bridge-utils virt-manager python python-pip libguestfs
scrot
htop
optipng
aur/mangohud-git
dosbox
aur/libspeedhack-git
libqalculate
zbar
archiso
asciinema
fcron
reflector
exiv2
curl wget
ntp
aur/aria2-fast
lshw
ffmpeg
xdg-user-dirs xdg-utils perl-file-mimeinfo
go
imagemagick
iputils
lua
aur/volta-bin
ufw
composer
docker docker-compose docker-machine
fcitx5 fcitx5-anthy fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-nord fcitx5-table-other
aur/gammy-git
ripgrep
pass pass-otp
aur/youtube-dl-git aur/yt-dlp-git aur/phantomjs-bin
aur/gallery-dl-git
aur/qimgv-git
zathura zathura-pdf-mupdf
rustup
python
screenkey
stow
xdg-user-dirs (and the wiki - th esetup part as well!)
gamemode
jq tidy yq
aur/pup-git fq
maria-db
```

Potentially(?):
```
dvd+rw-tools
nautilus
terminus-font
```

### XDG-MIME
```
xdg-mime default librewolf.desktop x-scheme-handler/http
xdg-mime default org.pwmt.zathura.desktop application/pdf
```

TBD: bluez, networkmanager
japanese fonts

steam settings preserve
libvirt setup (enabling services?)
add Auto power-on after boot and other processes related to setting up bluetooth
https://wiki.archlinux.org/title/Bluetooth#Auto_power-on_after_boot

maria-db post install process

archivers list packages
set XDG vars

java
