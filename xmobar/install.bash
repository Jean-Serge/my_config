#! /bin/bash

# We check if the XMobar configuration file exists 
# It will be archived if not.
path=$HOME/.xmobarrc

if [ -f $path ]
then
	if [ ! -f $path.bak ]
	then
		echo "The file "$path" already exists, he'll be moved into the "$path".bak path."
		mv $path $path.bak
	else
		rm $path.bak
		mv $path $path.bak
	fi
fi

# TODO : check the location from where the script is launch (see Issue #1 on github)
cp .xmobarrc $path
