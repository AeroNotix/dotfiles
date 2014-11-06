xsetroot -cursor_name left_ptr &
xflux -l 50.0614 -g 19.9372
syndaemon -t -k -i 2 -d &
dropboxd &
java -jar /home/xeno/dev/pismo/target/pismo-0.1.0-SNAPSHOT-standalone.jar &
#exec bash -c '(/usr/bin/wingo && cat)'
exec xmonad
#exec stumpwm
