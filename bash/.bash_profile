export XDG_CONFIG_HOME="$HOME/.config"
export VISUAL='vim'
export EDITOR='vim'
export QT_QPA_PLATFORMTHEME='qt5ct'

export MONITOR='DSI1'
export RESOLUTION='1200x800'
#old modeline settings (to be deleted)
#export MODE_P_NAME='1920x1080-165Hz'
#export MODE_P_CVT=$(cvt 1920 1080 164.92 | sed '1d' | sed -r 's#Modeline\s+".*"(.*)$#'\""$MODE_P_NAME"\"\\1'#')

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

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export CACA_DRIVER='ncurses'
# find with `scanimage -L`
export SANE_DEFAULT_DEVICE='airscan:e0:Canon TS6400 series'

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx "$HOME/.config/X11/xinitrc"
fi
