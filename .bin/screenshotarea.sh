#!/usr/bin/sh

D=`date | tr ' ' '_'`.jpg
import $D
mv $D $HOME/.dropbox_files/Dropbox/Screenshots/
