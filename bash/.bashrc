# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="$HOME/.config"
export VISUAL="vim"
export EDITOR="vim"

export MONITOR_P="DisplayPort-0"
export MODE_P_NAME="1920x1080-165Hz"
export MODE_P_CVT=$(cvt 1920 1080 164.92 | sed '1d' | sed -r 's#Modeline\s+".*"(.*)$#'\""$MODE_P_NAME"\"\\1'#')
export MOUSE='ASUSTeK ROG STRIX IMPACT II WIRELESS'

export GEM_HOME="$HOME/gems"
export GEM_HOME_ALT="$HOME/.local/share/gem/ruby/3.0.0"
export VOLTA_HOME="$HOME/.volta"
export EMACS_HOME="$HOME/.emacs.d/"
export COMPOSER_HOME="$HOME/.config/composer/vendor"
export PATH=\
"$VOLTA_HOME/bin:"\
"$GEM_HOME/bin:"\
"$GEM_HOME_ALT/bin:"\
"$EMACS_HOME/bin:"\
"$COMPOSER_HOME/bin:"\
"$HOME/.local/bin:"\
"$PATH"

export MONITOR="eDP1"

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export CACA_DRIVER="ncurses"
# find with `scanimage -L`
export SANE_DEFAULT_DEVICE='airscan:e0:Canon TS6400 series'

alias ls="exa --color=auto --group-directories-first"
alias ll="ls -l"
alias la="ls -la"
alias headn="head -n 15"
alias tailn="tail -n 15"

alias list-cursors="find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name 'cursors' | grep -v 'No such file'"
alias list-themes="find /usr/share/themes /usr/local/share/themes ~/.local/share/themes ~/.themes -type d | grep -v 'No such file'"
alias list-fonts="fc-list"
alias recent-packages="$HOME/bash-scripts/utils/recent-packages.sh"
alias path="echo $PATH | sed -r 's/:/\n/g'"
alias dvterm="$HOME/bash-scripts/utils/download-video-for-terminal.sh"
alias pvterm="$HOME/bash-scripts/utils/terminal-play-video.sh $1"
alias vdl="yt-dlp --downloader aria2c --downloader-args 'aria2c:-c -j 8 -s 8 -x 8 -k 1M'"
alias ytmpv="mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --ytdl-raw-options=cookies=~/cookies.txt --msg-level=all=no,ytdl_hook=trace"
alias ytmpva="mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --ytdl-format=bestaudio --msg-level=all=no,ytdl_hook=trace"
alias dfile="aria2c -c -j 8 -s 8 -x 8 -k 1M"
alias dfilef="aria2c -c -s 499 -x 499 -k 1M -j 1"
alias c="$HOME/bash-scripts/utils/capture-no-audio.sh"
alias cl="$HOME/bash-scripts/utils/capture-no-audio-losless.sh"
alias ca="$HOME/bash-scripts/utils/capture-with-audio.sh"
alias cla="$HOME/bash-scripts/utils/capture-with-audio-losless.sh"

alias scan="$HOME/bash-scripts/printer/scan.sh"
alias scanmax="$HOME/bash-scripts/printer/scan-max.sh"
alias yarn-v="$HOME/bash-scripts/yarn/yarn-versions.sh"

alias nn="neofetch"
alias vd="vidir"
alias o="xdg-open"

PS1='[\u@\h \W]\$ '
