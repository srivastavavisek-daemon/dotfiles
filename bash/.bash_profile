#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# AUTO-START X ON TTY1
#if [[ -z $DISPLAY ]] && [[ "$(tty)" = /dev/tty1 ]]; then
#    exec startx
#fi
