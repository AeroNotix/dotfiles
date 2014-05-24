import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = do
  let ssh_cmd = "termite -e 'ssh xeno@zerolength.com -t tmux attach-session -d -t weechat'" in
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
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
        , (( mod1Mask .|. shiftMask, xK_w),      spawn "steam")
        , (( mod1Mask .|. shiftMask, xK_y),      spawn "pidgin")
        , (( mod1Mask .|. shiftMask, xK_e),      spawn "emacsclient -c")
        ]
