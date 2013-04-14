# -*- coding: utf-8 -*-

import subprocess
from time import sleep

from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.manager import Key, Click, Drag, Screen, Group


class Notice(widget.TextBox):
     def update(self, text):
          if text in self.text:
               return
          self.text += " " + text
          self.bar.draw()

     def button_press(self, x, y, button):
          open("/home/xeno/log", "a").write("sup\n")
          self.text = ""
          self.bar.draw()

# constants
sup = "mod4"
alt = "mod1"
shift = "shift"

keys = [

# COMPUTER CONTROL
     Key([alt, shift], "l", lazy.spawn("pkill -KILL -u $USER")),

# SWAP MASTER WINDOWS AROUND
    Key([alt], "j", lazy.layout.down()),
    Key([alt], "k", lazy.layout.up()),

 # SCREENSWITCHER
    Key([alt], "Tab", lazy.to_next_screen()),

# MOVEMENT KEYS
    # kill current window
    Key([alt, "shift"], "c", lazy.window.kill()), 

    # cycle to previous group
    Key([sup], "Left", lazy.group.prevgroup()),

    # cycle to next group
    Key([sup], "Right", lazy.group.nextgroup()),

    # Shuffle MonadTall layout up
    Key([sup], "Up", lazy.layout.shuffle_up()),

    # Shuffle MonadTall layout down
    Key([sup], "Down", lazy.layout.shuffle_down()),
    
# APPLICATION LAUNCHERS
    Key([alt, "shift"], "Return", lazy.spawn("urxvt")),
    Key([alt, "shift"], "e", lazy.spawn("emacsclient -c")),
    Key([alt, "shift"], "f", lazy.spawn("chromium")),
    Key([alt, "shift"], "g", lazy.spawn("gimp")),
    Key([alt, "shift"], "i", lazy.spawn("urxvt -e weechat-curses")),
    Key([alt, "shift"], "m", lazy.spawn("urxvt -e ncmpcpp")),
    Key([alt, "shift"], "r", lazy.spawn("urxvt -e mutt")),
    Key([alt, "shift"], "s", lazy.spawn("skype")),
    Key([alt, "shift"], "v", lazy.spawn("vlc")),
    Key([alt, "shift"], "w", lazy.spawn("steam")),
    
# AUDIO
    Key([alt], "F11", lazy.spawn("amixer -c 0 --quiet set Master 1-")),
    Key([alt], "F12", lazy.spawn("amixer -c 0 --quiet set Master 1+")),
    Key([alt], "F4",  lazy.spawn("ncmpcpp prev")),
    Key([alt], "F5",  lazy.spawn("ncmpcpp pause")),
    Key([alt], "F6",  lazy.spawn("amixer -c 0 --quiet set Master mute")),
    Key([alt], "F7",  lazy.spawn("amixer -c 0 --quiet set Master unmute")),
    Key([alt], "F8",  lazy.spawn("ncmpcpp play")),
    Key([alt], "F9",  lazy.spawn("ncmpcpp next")),
    
# PRINT SCREEN TO FILE
    Key([alt], "F10", lazy.spawn("import -window root ~/screenshot.png")),
    Key([alt, "shift"], "F10", lazy.spawn("take_pic")),
    
# CHANGE WALLPAPER
    Key([alt], "F1", lazy.spawn("wallpaperchanger -timeout 1 -folder /storage/Users/Skynet/Pictures/Wallpaper/")),

# BASE COMMANDS
    # shutdown
    Key([alt, "shift"], "q", lazy.shutdown()),
    # restart qtile
    Key([alt, "shift"], "p", lazy.restart()),
    # toggle floating
    Key([alt], "t", lazy.window.toggle_floating()),
]

mouse = [
    Drag([alt], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([alt], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([alt], "Button2", lazy.window.bring_to_front())
]

# Next, we specify group names, and use the group position to generate
# a key binding for it.

groups = [
     Group('scr'),
     Group('net'),
     Group('emacs'),
     Group('dev'),
     Group('mail'),
     Group('stats'),
     Group('etc'),
     Group('etc1'),
     Group('etc2'),
]

for index, grp in enumerate(groups):

     # index is the position in the group list grp is the group object.
     # We assign each group object a set of keys based on it's
     # position in the list.

     # Eventually we will implement a function to change the name based
     # on what window is active in that group.

     keys.extend([
         # switch to group
         Key([alt], str(index+1), lazy.group[grp.name].toscreen()),
         # send to group
         Key([alt, "shift"], str(index+1), lazy.window.togroup(grp.name)),
    ])

groups.extend([
          Group('etc4'),
          Group('etc5'),
          Group('etc6'),
          Group('etc7'),
          Group('skype')
])

# MonadTall is the master race layout
layouts = [
    layout.MonadTall(),
]

# orange text on grey background
default_data = dict(fontsize=14,
                    foreground="FF6600",
                    background="1D1D1D",
                    font="ttf-droid")
default_data_small = dict(fontsize=12,
                    foreground="FF6600",
                    background="1D1D1D",
                    font="ttf-droid")

screens = [
     Screen(bottom = bar.Bar([widget.WindowName(**default_data_small),
                              widget.Clock(**default_data_small),],
                             27,),
            
            ),
     Screen(bottom = bar.Bar([widget.GroupBox(**default_data),
                              widget.WindowName(**default_data),
                              Notice(name="notice", **default_data),
                              widget.Clock(**default_data)],
                              32,))
]

@hook.subscribe.client_new
def dialogs(window):

     """
     Sets dialogs to floating
     """

     from xcb.xproto import WindowError
     
     try:
          if (window.window.get_wm_type() == 'dialog'
              or window.window.get_wm_transient_for()):
               window.floating = True
     except WindowError as e:
          pass

@hook.subscribe.client_new
def grouper(window, windows={
          'chromium': 'net',
          'emacs': 'emacs',
          'skype': 'skype',
          }):
     
     """
     Usage for single windows:
     {window_name: group_name}

     Usage for multiple windows:
     {window_name: [group_namea, group_nameb, etc}
     
     Here:
     {window_name: [group_name1, group_name2]}
     """
     
     try:
          windowtype = window.window.get_wm_class()[0]
     except Exception as e:
          with open('/home/xeno/logfile', 'a') as logfile:
               logfile.write(''.join(['\n', str(e)]))
               return
        
     if windowtype in windows.keys():
         if windowtype != 'urxvt':
             window.togroup(windows[windowtype])
             windows.pop(windowtype)
         else:
             try:
                 window.togroup(windows[windowtype][0])
                 windows[windowtype].pop(0)
             except IndexError:
                 pass
'''
@hook.subscribe.startup          
def startup():
     programs = [
          ['chromium'],
          ['spawnskype'],
          ['emacsclient', '-c'],
          ]

     for program in programs:
          subprocess.Popen(program)
          sleep(0.1)
'''
