#! /bin/bash

# Check if xterm is installed
command -v xterm > /dev/null
if [ ! $? -eq 0 ]
then
	echo "You must install xterm to configure xterm (surprising isn't it?)"
	exit 1
fi

# Check if xrdb is installed
command -v xrdb > /dev/null
if [ $? -eq 0 ]
then
	# When everything is ok, apply configuration to xterm
	xrdb -merge .Xresources
else
	echo 'You must install xrdb to run this script.'
fi
