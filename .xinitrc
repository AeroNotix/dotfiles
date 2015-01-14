export _JAVA_AWT_WM_NONREPARENTING=1
xsetroot -cursor_name left_ptr &
syndaemon -t -k -i 2 -d &
/usr/bin/java -Xms100m -Xmx100m -jar /home/xeno/dev/pismo/target/uberjar/pismo.jar &
dropboxd &
exec xmonad
