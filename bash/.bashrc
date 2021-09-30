# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export MONITOR="eDP1"

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export CACA_DRIVER="ncurses"

alias ls="ls --color=auto"
alias ll="ls -loh"
alias la="ls -laoh"
alias headn="head -n 15"
alias tailn="tail -n 15"

alias list-cursors="find /usr/share/icons ~/.local/share/icons ~/.icons -type d -name 'cursors' | grep -v 'No such file'"
alias list-themes="find /usr/share/themes /usr/local/share/themes ~/.local/share/themes ~/.themes -type d | grep -v 'No such file'"
alias list-fonts="fc-list"
alias recent-packages="$HOME/bash-scripts/utils/recent-packages.sh"
alias dvterm="$HOME/bash-scripts/utils/download-video-for-terminal.sh"
alias pvterm="$HOME/bash-scripts/utils/terminal-play-video.sh $1"

alias nn="neofetch"

PS1='[\u@\h \W]\$ '
