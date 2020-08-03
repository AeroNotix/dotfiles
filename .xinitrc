export _JAVA_AWT_WM_NONREPARENTING=1
systemctl --user import-environment DISPLAY
dunst &
xsetroot -cursor_name left_ptr
xrdb ~/.Xresources
source ~/.screenlayout/*.sh

exec xmonad
