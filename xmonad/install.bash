#! /bin/bash

###
#	Check if the tested file exists.
#	Works with files, directory and symbolic link.
###
function exist
{
	if [ -f $1 -o -d $1 -o -L $1 ]
	then
		echo "The file "$1" already exists."
		return 1
	fi

	return 0
}

###
#	Check if the file exists and archive it if yes.
#	The file will be rename adding a .bak at the end of its name.
###
function archive
{
	exist $1
	if [ ! $? -eq 0 ]
	then
		exist $1.bak
		if [ ! $? -eq 0 ]
		then
			# TODO : issue if the tested file is a non-relative symbolic link
			echo "The file "$1" already exists, he'll be moved into the "$1".bak path"
			mv $1 $1.bak
		else
			rm $1
		fi
	fi

	return 0
}

archive $HOME/.xmonad

ln -rs .xmonad $HOME/.xmonad
xmonad --recompile && xmonad --restart
