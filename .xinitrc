#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# xrandr settings.
xrandr --output DFP2 --mode 1920x1080 --right-of CRT2
# PATHS
export PATH=$PATH:/usr/lib/go/site/bin
# Set default browser
export BROWSER=/usr/bin/chromium
# fix internet
sudo dhcpcd net0 &
# set the pointer to an arrow
xsetroot -cursor_name left_ptr &
# set keyboard
setxkbmap gb &
# Start the emacs daemon
emacs --daemon &
# Synchronize the time
sudo ntpd -qg &
# fix broken kb
xmodmap -e 'clear lock' -e 'keycode 0x42 = Control_L'
xrdb ~/.Xresources &
# enable wallpaper changer script
wallpaperchanger -folder /storage/Users/Skynet/Pictures/Wallpaper/ --cont &
case $1 in
xfce4)
	exec xfce4-session
	;;
qtile)
    exec qtile
	;;
esac

