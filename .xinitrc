export _JAVA_AWT_WM_NONREPARENTING=1
systemctl --user import-environment DISPLAY
dunst &
xsetroot -cursor_name left_ptr
xrdb ~/.Xresources
source ~/.screenlayout/*.sh
sudo sh -c 'echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo'
for i in {0..11}; do
    sudo sh -c "echo powersave > /sys/devices/system/cpu/cpu${i}/cpufreq/scaling_governor"
done


exec xmonad
