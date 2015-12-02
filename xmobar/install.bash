#! /bin/bash

path=$HOME/.xmobarrc

if [ -f $path -o -L $path ]
then
	echo "The file "$path" already exists, he'll be moved into the "$path".bak path."
	mv $path $path.bak
fi

# TODO : check the location from where the script is launch
ln -rs .xmobarrc $path
