#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
sysxprofile=/etc/xprofile
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userxprofile=$HOME/.xprofile

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$sysxprofile" ]; then
  source $sysxprofile
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -f "$userxprofile" ]; then
  source $userxprofile
fi

exec i3
