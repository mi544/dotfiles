# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='exa --color=auto --group-directories-first'
alias ll='ls --long'
alias la='ll --all'
alias ld="ll | rg --color never '^(d|l)' | sed 's#-> .*##'"
alias headn='head -n 15'
alias tailn='tail -n 15'

alias list-cursors="find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name 'cursors' | grep -v 'No such file'"
alias list-themes="find /usr/share/themes /usr/local/share/themes ~/.local/share/themes ~/.themes -type d | grep -v 'No such file'"
alias list-fonts='fc-list'
alias recent-packages="$HOME/bash-scripts/utils/recent-packages.sh"
alias path="echo $PATH | sed -r 's/:/\n/g'"
alias dvterm="$HOME/bash-scripts/utils/download-video-for-terminal.sh"
alias pvterm="$HOME/bash-scripts/utils/terminal-play-video.sh $1"
alias vdl="yt-dlp --downloader aria2c --downloader-args 'aria2c:-c -j 8 -s 8 -x 8 -k 1M'"
alias ytmpv='mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --msg-level=all=no,ytdl_hook=trace'
alias ytmpva='mpv --no-config --script-opts=ytdl_hook-ytdl_path=yt-dlp --ytdl-format=bestaudio --msg-level=all=no,ytdl_hook=trace'
alias dfile='aria2c -c -j 8 -s 8 -x 8 -k 1M'
alias dfilef='aria2c -c -s 499 -x 499 -k 1M -j 1'
alias c="$HOME/bash-scripts/utils/capture-no-audio.sh"
alias cl="$HOME/bash-scripts/utils/capture-no-audio-losless.sh"
alias ca="$HOME/bash-scripts/utils/capture-with-audio.sh"
alias cla="$HOME/bash-scripts/utils/capture-with-audio-losless.sh"

alias scan="$HOME/bash-scripts/printer/scan.sh"
alias scanmax="$HOME/bash-scripts/printer/scan-max.sh"
alias yarn-v="$HOME/bash-scripts/yarn/yarn-versions.sh"

alias nn='neofetch'
alias vd='vidir'
alias o='xdg-open'

PS1='[\u@\h \W]\$ '
