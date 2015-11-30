#! /bin/bash

###
#	Check if the tested file exists.
#	If yes, it will be moved into a .bak file.
###
function exist
{
	if [ -f $1 -o -d $1 -o -L $1 ]
	then
		# TODO : issue if the tested file is a non-relative symbolic link
		echo "The file "$1" already exists, he'll be moved into the "$1".bak path"
		return 1
	fi

	return 0
}

function archive
{
	exist $1
	if [ ! $? -eq 0 ]
	then
		mv $1 $1.bak
	fi

	return 0
}

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

exists_command vim
exists_command git

# TODO : check if the script is executed with the good path.

archive $HOME/.vimrc
archive $HOME/.vim

ln -rs .vimrc $HOME/.vimrc
ln -rs .vim $HOME/.vim

cd .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ./Vundle.vim
cd ../..

vim +PluginInstall +qall
