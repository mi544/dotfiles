[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx "$HOME/.config/X11/xinitrc"
fi
