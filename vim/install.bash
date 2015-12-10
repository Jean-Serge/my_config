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

###
#	Check if the specified command exists.
###
function exists_command
{
	command -v $1 >/dev/null
	if [ ! $? -eq 0 ]
	then
		echo $1" command doesn't exist, you must install it to run this script."
		exit 1
	fi

	return 0
}

##########################################
# Main
##########################################

exists_command vim
exists_command git

# TODO : check if the script is executed with the good path.

archive $HOME/.vimrc
archive $HOME/.vim

cp .vimrc $HOME/.vimrc
cp -r .vim $HOME/.vim

# Vundle Installation
wd=$PWD

cd $HOME/.vim/bundle
exist ./Vundle.vim
if [ $? -eq 0 ]
then
	git clone https://github.com/VundleVim/Vundle.vim.git ./Vundle.vim
else
	cd Vundle.vim
	git pull
	cd ..
fi
	
cd $wd
# Run Vim and install all plugins.
vim +PluginInstall +qall
