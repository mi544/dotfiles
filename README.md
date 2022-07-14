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
### LSP
```
gopls
```

```
volta install svelte-language-server
volta install surge
```

### Node
Node versioning and global npm package management is handled through
[Volta](https://volta.sh/)  

- Install `aur/volta-bin`
- Run `volta install` with the following arguments:

```
node@lts yarn
remark-cli remark-lint remark-toc remark-preset-lint-consistent remark-preset-lint-recommended remark-preset-lint-markdown-style-guide
npm-check-updates serve lerna @nestjs/cli @vue/cli
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

### Java Environment
```
jre-openjdk jre-openjdk-headless jdk-openjdk openjdk-doc
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
man-db man-pages vim sudo git stow
networkmanager networkmanager-openvpn polkit
bluez bluez-utils
pipewire pipewire-docs pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire lib32-pipewire-jack wireplumber helvum gst-plugin-pipewire
grub efibootmgr
pamixer pavucontrol
```

```
groupadd docker
useradd -m mi
usermod -aG wheel,audio,realtime,video,storage,docker,libvirt mi
visudo
```

```
systemctl disable systemd-resolved
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable fcron
systemctl enable ntpd
systemctl enable cups
systemctl enable avahi-daemon
```

```
# Uncomment lib32 in pacman.conf
```

### Basic System Tools, Graphics, Desktop
```
aur/aura-bin
xorg-server xorg-xinit xorg-apps xclip xdo xdotool wmctrl clipit
xf86-video-amdgpu mesa lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader vulkan-radeon lib32-vulkan-radeon
bspwm sxhkd nitrogen unclutter
polybar|aur/polybar picom|aur/picom-git rofi|aur/rofi-git
aur/neovim-git aur/neovim-plug-git aur/efm-langserver-git
```

### Fonts
```
gnu-free-fonts
otf-ipafont ttf-hanazono
aur/ttf-dejavu-ib aur/ttf-nunito aur/ttf-nunito-sans
```

### Apps
#### Native Games
```
aisleriot gnuchess knights gnome-chess aur/spacecadetpinball-git
aur/scid aur/stockfish
0ad 0ad-data
```
#### Game Clients
```
aur/airshipper
```
#### Emulators
```
ppsspp mgba-qt aur/rpcs3-bin aur/yuzu-mainline-bin
dosbox
```
#### Photo
```
imagemagick ghostscript pdftk
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
aur/tenacity-git aur/reaper-bin
aur/deadbeef
aur/jamesdsp
aur/cava-git aur/cli-visualizer-git
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
blender aur/opencl-amd
aur/insomnia-bin
aur/rustdesk-bin
aegisub
dbeaver
aur/anki
```

#### Theming
```
xfce4-settings
qt5ct
nordic-theme-git nordic-kde-git
```

### Utils
### Terminal
```
neofetch
exa
mitmproxy
qrencode
termdown
nnn aur/vidir
asciinema
cool-retro-term
cmatrix figlet lolcat asciiquarium
aur/tealdeer-git
s3cmd
evtest usbutils
```

```
cups cups-pdf avahi nss-mdns
sane sane-airscan
wine-staging wine-gecko wine-mono lib32-libpulse lib32-openal
aur/winetricks-git
libvirt qemu iptables-nft dnsmasq bridge-utils virt-manager python python-pip libguestfs
scrot
gendesk
wiggle
htop
zip
optipng
copyq
aur/mangohud-git
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
xdg-user-dirs (and the wiki - th esetup part as well!)
gamemode
jq tidy yq
aur/pup-git fq
maria-db
sha3sum
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


---

```shell
iwctl
timedatectl set-ntp true
fdisk # efi
.
mkfs.ext4 # root
mkfs.fat -F 32 # efi
mount /dev/root /mnt
mount --mkdir /dev/efi /mnt/boot
reflector --sort rate --save /etc/pacman.d/mirrorlist --protocol https --latest 50 -c US,CH,SE
pastrap /mnt ...
arch-chroot /mnt
vim /etc/fstab
ln -sf /usr/share/zoneinfo/... /etc/localtime
hwclock --systohc
vim /etc/locale.gen
locale-gen
LANG=un_US.UTF8 > /etc/locale.conf
echo ... > /etc/hostname
vim /etc/mkinitcpio.conf
mkinitcpio -P
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
vim /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
passwd
```
