import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.CycleWS
import Graphics.X11.ExtraTypes.XF86


amixerCmd s =
  spawn $ "amixer -c 0 --quiet set Master " ++ s

mpc s =
  spawn $ "mpc " ++ s

main = do
   xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
   xmonad $ defaultConfig
        { focusFollowsMouse = False
        , borderWidth = 10
        , focusedBorderColor = "#336699"
        , normalBorderColor  = "#000000"
        , manageHook = insertPosition Below Newer
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        } `additionalKeys`
        [ (( mod1Mask .|. shiftMask, xK_i      ), spawn "roxterm -e 'ssh xeno@zerolength.com -t tmux attach-session -d -t weechat'")
        , (( mod1Mask .|. shiftMask, xK_b      ), spawn "roxterm -e 'ncxbacklight'")
        , (( mod1Mask .|. shiftMask, xK_Return ), spawn "roxterm")
        , (( mod1Mask .|. shiftMask, xK_e      ), spawn "emacsclient -c")
        , (( mod1Mask .|. shiftMask, xK_f      ), spawn "chromium --force-device-scale-factor=2")
        , (( mod1Mask .|. shiftMask, xK_g      ), spawn "gimp")
        , (( mod1Mask .|. shiftMask, xK_k      ), spawn "keepassx")
        , (( mod1Mask .|. shiftMask, xK_m      ), spawn "roxterm -e 'ncmpcpp'")
        , (( mod1Mask .|. shiftMask, xK_s      ), spawn "skype")
        , (( mod1Mask .|. shiftMask, xK_v      ), spawn "vlc")
        , (( mod1Mask .|. shiftMask, xK_w      ), spawn "steam")
        , (( mod1Mask .|. shiftMask, xK_y      ), spawn "pidgin")
        , (( mod1Mask,               xK_F11    ), amixerCmd "1-")
        , (( mod1Mask,               xK_F12    ), amixerCmd "1+")
        , (( mod1Mask,               xK_F4     ), mpc "prev")
        , (( mod1Mask,               xK_F5     ), mpc "pause")
        , (( mod1Mask,               xK_F6     ), spawn "amixer -c 0 --quiet set Master mute")
        , (( mod1Mask,               xK_F7     ), spawn "amixer set Master unmute")
        , (( mod1Mask,               xK_F8     ), mpc "play")
        , (( mod1Mask,               xK_F9     ), mpc "next")
        , (( mod1Mask,               xK_c      ), sendMessage (IncMasterN 1))
        , (( mod1Mask,               xK_v      ), sendMessage (IncMasterN (-1)))
        , (( mod4Mask,               xK_m      ), spawn "roxterm -e 'mutt'")
        , (( controlMask,            xK_p      ), spawn "dmenu_run -fn 'Monaco-25'")
        , (( mod4Mask,               xK_q      ), spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")
        , (( mod1Mask,               xK_Tab    ), nextScreen)
        , (( mod4Mask,               xK_Left   ), prevWS)
        , (( mod4Mask,               xK_Right  ), nextWS)
        , (( mod4Mask,               xK_s      ), spawn "dbx.sh")
        , (( 0       , xF86XK_MonBrightnessUp  ), spawn "xbacklight -inc 40")
        , (( 0     , xF86XK_MonBrightnessDown  ), spawn "xbacklight -dec 40")
        ] `removeKeys`
        [ (( mod1Mask, xK_space  ))
        , (( mod1Mask, xK_period ))
        , (( mod1Mask, xK_comma  ))
        , (( mod1Mask, xK_q      ))
        , (( mod1Mask, xK_o      ))
        , (( mod1Mask, xK_w      ))
        , (( mod1Mask, xK_p      ))
        , (( mod1Mask, xK_c      ))
        , (( mod1Mask, xK_n      ))
        , (( mod1Mask, xK_v      ))
        , (( mod1Mask, xK_Return ))
        , (( mod1Mask, xK_slash  ))
        , (( mod1Mask, xK_question ))
        ]
