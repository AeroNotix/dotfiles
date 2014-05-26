xsetroot -cursor_name left_ptr &
syndaemon -t -k -i 2 -d &
godoc -http=":6060" &
dropboxd &
emacs --daemon
java -jar /home/xeno/dev/pismo/target/pismo-0.1.0-SNAPSHOT-standalone.jar &
#exec bash -c '(/usr/bin/wingo && cat)'
exec xmonad | xmobar
