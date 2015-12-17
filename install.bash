#! /bin/bash

# TODO : check the location from where the script is launch (see Issue #1 on github)

X='xorg-server xorg-xinit'
XTERM='xterm ttf-dejavu'
XMONAD='xmonad xmonad-contrib dmenu xmobar'
VIM='vim'
OTHERS='npm git'

ALL=$X' '$XTERM' '$XMONAD' '$VIM' '$OTHERS


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

function get_package_manager
{
	ARCH=`cat /etc/issue | cut -f 1 -d ' '`
	case $ARCH in
		"Arch")
			PM="pacman -S"
			;;
		"Debian")
			PM="apt-get install"
			;;
		"Ubuntu")
			PM="apt-get install"
			;;
		*)
			return 1
			;;
	esac

}

##########################################
# Installation functions
##########################################

function install_packages
{
	get_package_manager
	if [ $? -eq 1 ]
	then
		echo -e "\\e[31mThere is a problem determining which package manager you're using,  so the installation cannot be done.\\e[39m"
		return 1
	fi
	echo 'Installation of all the dependancies.'
	su -c "$PM $ALL"
	echo 'All the needed packages have been installed.'
}

function full_install
{
	install_packages
	echo '-----------------------'
	install_vim
	echo '-----------------------'
	install_xmonad
	echo '-----------------------'
	install_xmobar
	echo '-----------------------'
	install_livedown
}

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
	echo 'exec xmonad' >> $HOME/.xinitrc
	echo 'XMonad correctly configured.'
}

function install_livedown
{
	echo -e 'Starting \e[34mLivedown\e[39m installation.'
	su -c "npm install -g livedown"
	
	if [ $? -eq 0 ]
	then
		echo 'Livedown correctly installed.'
		return 0
	else
		echo -e '\e[31mProblem with Livedown installation.\e[39m'
		return 1
	fi
}
##########################################
# Main
##########################################

#install_packages
#echo '-----------------------'
#install_vim
#echo '-----------------------'
#install_xmobar
#echo '-----------------------'
#install_xmonad
#echo '-----------------------'
#install_livedown
full_install

echo 'Installation finished.'
