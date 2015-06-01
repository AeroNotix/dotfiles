export _JAVA_AWT_WM_NONREPARENTING=1
export QT_DEVICE_PIXEL_RATIO=2
xsetroot -cursor_name left_ptr &
syndaemon -t -k -i 2 -d &

[ -e /usr/bin/dropboxd ] && /usr/bin/dropboxd &

exec xmonad
