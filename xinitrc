if [ -f $HOME/.Xmodmap ]; then
  /usr/bin/xmodmap $HOME/.Xmodmap
fi
wal -i "$(< "${HOME}/.cache/wal/wal")"
