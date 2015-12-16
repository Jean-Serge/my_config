#! /bin/bash

# TODO : check the location from where the script is launch (see Issue #1 on github)

XTERM='xterm ttf-dejavu'
XMONAD='xmonad xmonad-contrib dmenu xmobar'
VIM='vim'
LIVEDOWN='livedown rpm'

ALL='git '$XTERM' '$XMONAD' '$VIM' '$LIVEDOWN


##########################################
# Functions
##########################################

###
#	Check if the tested file exists.
#	The file will be rename adding a .bak at the end of its name.
#	Works with files, directory and symbolic link.
###
function archive
{
	if [ -f $1 -o -d $1 -o -L $1 ]
	then
		if [ -f $1.bak -o -d $1.bak -o -L $1 ]
		then
			rm -rf $1.bak
		fi
		mv $1 $1.bak
		return 1
	fi

	return 0
}

###
#	Check if the specified command exists.
###
#function exists_command
#{
#	command -v $1 >/dev/null
#	if [ ! $? -eq 0 ]
#	then
#		exit 1
#	fi
#
#	return 0
#}

##########################################
# Installation functions
##########################################

function install_vim
{
	echo -e 'Starting \e[34mVim\e[39m configuration.'
	cd vim 

	archive $HOME/.vimrc
	archive $HOME/.vim
	
	cp .vimrc $HOME/.vimrc
	cp -r .vim $HOME/.vim

	# Vundle Installation
	wd=$PWD

	cd $HOME/.vim/bundle

	if [ ! -d Vundle.vim ]
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

	cd ..
	echo 'Vim correctly configured.'
}

function install_xmobar
{
	echo -e 'Starting \e[34mXMobar\e[39m configuration.'
	cd xmobar

	# We check if the XMobar configuration file exists 
	# It will be archived if not.
	archive $HOME/.xmobarrc

	cp .xmobarrc $HOME

	cd ..
	echo 'XMobar correctly configured.'
}

function install_xmonad
{
	echo -e 'Starting \e[34mXMonad\e[39m configuration.'
	cd xmonad

	archive $HOME/.xmonad

	cp -r .xmonad $HOME/.xmonad
	echo -e 'Recompiling xmonad...'
	xmonad --recompile && xmonad --restart

	cd ..
	echo 'XMonad correctly configured.'
}

##########################################
# Main
##########################################

install_vim
echo '-----------------------'
install_xmobar
echo '-----------------------'
install_xmonad

echo 'Installation finished.'
