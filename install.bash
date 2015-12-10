#! /bin/bash

XTERM='xterm ttf-dejavu'
XMONAD='xmonad dmenu xmobar'
VIM='vim'
LIVEDOWN='livedown rpm'

ALL='git '$XTERM' '$XMONAD' '$VIM' '$LIVEDOWN


apt-get install $ALL
pacman -S $ALL
