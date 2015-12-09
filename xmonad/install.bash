#! /bin/bash

if [ -d $HOME/.xmonad ]
then
	mv $HOME/.xmonad $HOME/.xmonad.bak
elif [ -L $HOME/.xmonad ]
then
	rm $HOME/.xmonad
fi

ln -rs .xmonad $HOME/.xmonad
xmonad --recompile && xmonad --restart
