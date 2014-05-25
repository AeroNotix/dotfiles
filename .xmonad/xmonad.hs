import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.InsertPosition
import XMonad.Util.EZConfig


main = do
  let ssh_cmd = "termite -e 'ssh xeno@zerolength.com -t tmux attach-session -d -t weechat'" in
    xmonad $ defaultConfig
        { focusFollowsMouse = False
        , manageHook = insertPosition Below Newer
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        } `additionalKeys`
        [ (( mod1Mask .|. shiftMask, xK_i),      spawn ssh_cmd)
        , (( mod1Mask .|. shiftMask, xK_Return), spawn "termite")
        , (( mod1Mask .|. shiftMask, xK_f),      spawn "chromium")
        , (( mod1Mask .|. shiftMask, xK_m),      spawn "termite -e 'ncmpcpp'")
        , (( mod1Mask .|. shiftMask, xK_g),      spawn "gimp")
        , (( mod1Mask .|. shiftMask, xK_k),      spawn "keepassx")
        , (( mod1Mask .|. shiftMask, xK_v),      spawn "vlc")
        , (( mod1Mask .|. shiftMask, xK_s),      spawn "skype")
        , (( mod1Mask,               xK_o),      sendMessage NextLayout)
        , (( mod1Mask .|. shiftMask, xK_w),      spawn "steam")
        , (( mod1Mask .|. shiftMask, xK_y),      spawn "pidgin")
        , (( mod1Mask .|. shiftMask, xK_e),      spawn "emacsclient -c")
        , (( mod1Mask,               xK_F11),    spawn "amixer -c 0 --quiet set Master 1-")
        , (( mod1Mask,               xK_F12),    spawn "amixer -c 0 --quiet set Master 1+")
        , (( mod1Mask,               xK_F4),     spawn "ncmpcpp prev")
        , (( mod1Mask,               xK_F5),     spawn "ncmpcpp pause")
        , (( mod1Mask,               xK_F6),     spawn "amixer -c 0 --quiet set Master mute")
        , (( mod1Mask,               xK_F7),     spawn "amixer set Master unmute")
        , (( mod1Mask,               xK_F8),     spawn "ncmpcpp play")
        , (( mod1Mask,               xK_F9),     spawn "ncmpcpp next")
        ] `removeKeys`
        [ (( mod1Mask, xK_space)) ]
