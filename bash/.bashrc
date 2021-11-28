# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export MONITOR_P="DisplayPort-0"
export MODE_P_NAME="1920x1080-165Hz"
export MODE_P_CVT=$(cvt 1920 1080 164.92 | sed '1d' | sed -r 's#Modeline\s+".*"(.*)$#'\""$MODE_P_NAME"\"\\1'#')
export MOUSE='ASUSTeK ROG STRIX IMPACT II WIRELESS'

export EDITOR="vim"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export MONITOR="eDP1"

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export CACA_DRIVER="ncurses"

alias ls="exa --color=always --group-directories-first"
alias ll="ls -l"
alias la="ls -la"
alias headn="head -n 15"
alias tailn="tail -n 15"

alias list-cursors="find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name 'cursors' | grep -v 'No such file'"
alias list-themes="find /usr/share/themes /usr/local/share/themes ~/.local/share/themes ~/.themes -type d | grep -v 'No such file'"
alias list-fonts="fc-list"
alias recent-packages="$HOME/bash-scripts/utils/recent-packages.sh"
alias dvterm="$HOME/bash-scripts/utils/download-video-for-terminal.sh"
alias pvterm="$HOME/bash-scripts/utils/terminal-play-video.sh $1"
alias ytdl="yt-dlp -f bestvideo+bestaudio"
alias ytmpv="mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --msg-level=all=no,ytdl_hook=trace"
alias aria2d="aria2c -c -s 257 -x 257 -k 1M -j 1"

alias nn="neofetch"
alias zenith="zenith --disable-history -r 1000 -c 30 -d 20 -n 10 -g 20 -p 20"
alias zz="zenith"

PS1='[\u@\h \W]\$ '

source /home/mi/.config/broot/launcher/bash/br
