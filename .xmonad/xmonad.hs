import System.IO
import XMonad
import XMonad((<+>))
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.EwmhDesktops(fullscreenEventHook,ewmh)
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.CycleWS
import Graphics.X11.ExtraTypes.XF86


main = do
   xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
   xmonad $ ewmh $ defaultConfig
        { focusFollowsMouse = False
        , borderWidth = 1
        , focusedBorderColor = "#336699"
        , normalBorderColor  = "#000000"
        , manageHook = insertPosition Below Newer
        , handleEventHook = mconcat [ docksEventHook , handleEventHook defaultConfig <+> fullscreenEventHook]
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        } `additionalKeys`
        [ (( mod1Mask .|. shiftMask, xK_Return ), spawn "urxvt")
        , (( mod1Mask .|. shiftMask, xK_e      ), spawn "emacsclient -c")
        , (( mod1Mask .|. shiftMask, xK_f      ), spawn "chromium  --profile-directory=\"Default\"")
        , (( mod1Mask .|. shiftMask, xK_d      ), spawn "chromium --profile-directory=\"Profile 1\"")
        , (( mod1Mask .|. shiftMask, xK_k      ), spawn "keepassx")
        , (( mod1Mask .|. shiftMask, xK_v      ), spawn "vlc")
        , (( controlMask,            xK_p      ), spawn "dmenu_run -fn 'Monaco-12'")
        , (( mod4Mask,               xK_q      ), spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")
        , (( mod1Mask,               xK_Tab    ), nextScreen)
        , (( mod4Mask,               xK_space  ), sendMessage NextLayout)
        , (( noModMask,              xK_Print  ), spawn "xfce4-screenshooter")
        ] `removeKeys`
        [ (( mod1Mask, xK_space  ))
        , (( mod1Mask, xK_period ))
        , (( mod1Mask, xK_comma  ))
        , (( mod1Mask, xK_c      ))
        , (( mod1Mask, xK_m      ))
        , (( mod1Mask, xK_n      ))
        , (( mod1Mask, xK_o      ))
        , (( mod1Mask, xK_p      ))
        , (( mod1Mask, xK_q      ))
        , (( mod1Mask, xK_v      ))
        , (( mod1Mask, xK_w      ))
        , (( mod1Mask, xK_Return ))
        , (( mod1Mask, xK_slash  ))
        , (( mod1Mask, xK_question ))
        ]
