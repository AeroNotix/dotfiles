#!/usr/bin/sh

D=`date | tr ' ' '_'`.jpg
import $D
mv $D /mnt/RAID/Screenshots/
