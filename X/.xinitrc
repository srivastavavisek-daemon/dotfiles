#! /bin/sh
# vim:ts=4:sw=4:expandtab
        
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -merge ~/.Xresources

xset s off            # disable screen saver
xset s noblank        # disable blanking
xset -dpms            # disable DPMS (monitor sleep)
xset b off            # disable bell

# Key repeat rate: xset r rate <delay:milli-sec> <rate:repeats-per-sec>
# You can also test run it: same command
xset r rate 400 25

#setxkbmap -option caps:swapescape 
# wont work if i plugin my keyboard after login

# Launch i3
exec i3
