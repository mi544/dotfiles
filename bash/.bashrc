# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=auto"
alias ll="ls -loh"
alias la="ls -laoh"

alias list-cursors="find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name 'cursors' | grep -v 'No such file'"
alias list-themes="find /usr/share/themes /usr/local/share/themes ~/.local/share/themes ~/.themes -type d | grep -v 'No such file'"
alias recent-packages="$HOME/bash-scripts/utils/recent-packages.sh"
alias dvfterm="$HOME/bash-scripts/utils/download-video-for-terminal.sh"

alias nn="neofetch"

export MONITOR="eDP1"

PS1='[\u@\h \W]\$ '
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
