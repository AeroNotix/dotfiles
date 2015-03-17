#!/bin/sh

stngth=`iwconfig enp0s20u4 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
bars=`expr $stngth / 20`

case $bars in
  0)  bar='[-----]' ;;
  1)  bar='[/----]' ;;
  2)  bar='[//---]' ;;
  3)  bar='[///--]' ;;
  4)  bar='[////-]' ;;
  5)  bar='[/////]' ;;
  *)  bar='[-!!!-]' ;;
esac
echo $bar
