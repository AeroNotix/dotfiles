#!/usr/bin/sh

/usr/bin/emacsclient -e "(version)"
if [  $? -ne 0 ] ; then
    /usr/bin/emacs --daemon
fi
