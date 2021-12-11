# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export MONITOR_P="DisplayPort-0"
export MODE_P_NAME="1920x1080-165Hz"
export MODE_P_CVT=$(cvt 1920 1080 164.92 | sed '1d' | sed -r 's#Modeline\s+".*"(.*)$#'\""$MODE_P_NAME"\"\\1'#')
export MOUSE='ASUSTeK ROG STRIX IMPACT II WIRELESS'

export EDITOR="vim"

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

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
alias path="echo $PATH | sed -r 's/:/\n/g'"
alias dvterm="$HOME/bash-scripts/utils/download-video-for-terminal.sh"
alias pvterm="$HOME/bash-scripts/utils/terminal-play-video.sh $1"
alias vdl="yt-dlp --downloader aria2c --downloader-args 'aria2c:-c -j 8 -s 8 -x 8 -k 1M'"
alias ytdl="yt-dlp -f bestvideo+bestaudio"
alias ytmpv="mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --msg-level=all=no,ytdl_hook=trace"
alias d="aria2c -c -j 8 -s 8 -x 8 -k 1M"
alias df="aria2c -c -s 499 -x 499 -k 1M -j 1"
alias c="ffmpeg -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0+0,0 '$HOME/Capture/$(date +%s).mp4'"

alias nn="neofetch"

PS1='[\u@\h \W]\$ '
