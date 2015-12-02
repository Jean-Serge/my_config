#! /bin/bash

# We check if the XMobar configuration file exists 
# It will be archived if not.
path=$HOME/.xmobarrc

if [ -f $path -o -L $path ]
then
	echo "The file "$path" already exists, he'll be moved into the "$path".bak path."
	mv $path $path.bak
fi

# TODO : check the location from where the script is launch (see Issue #1 on github)
ln -rs .xmobarrc $path
