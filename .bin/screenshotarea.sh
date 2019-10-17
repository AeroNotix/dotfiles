#!/usr/bin/sh


D=`date | tr ' ' '_'`.jpg
import $D
mv $D $SCREENSHOT_DIRECTORY/
