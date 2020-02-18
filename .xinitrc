systemctl --user import-environment DISPLAY
dunst &
xsetroot -cursor_name left_ptr
xrdb ~/.Xresources
source ~/.screenlayout/*.sh
exec xmonad
