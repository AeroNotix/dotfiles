export _JAVA_AWT_WM_NONREPARENTING=1
xsetroot -cursor_name left_ptr &
syndaemon -t -k -i 2 -d &
dropboxd &
exec xmonad
