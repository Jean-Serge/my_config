#! /bin/bash

# TODO : check the location from where the script is launch (see Issue #1 on github)

##########################################
# Packages list
##########################################

X='xorg-server xorg-xinit'
XTERM='xterm ttf-dejavu'
XMONAD='xmonad xmonad-contrib dmenu xmobar'
VIM='vim'
BASE='npm git'


##########################################
# Options
##########################################

INSTALL_PACKAGES=1
INSTALL_VIM=0
INSTALL_XMOBAR=0
INSTALL_XMONAD=0
INSTALL_LIVEDOWN=0


##########################################
# Functions
##########################################

###
#  Check if the tested file exists.
#  The file will be rename adding a .bak at the end of its name.
#  Works with files, directory and symbolic link.
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
#  Check if the specified command exists.
###
#function exists_command
#{
#  command -v $1 >/dev/null
#  if [ ! $? -eq 0 ]
#  then
#    exit 1
#  fi
#
#  return 0
#}

function get_package_manager
{
  ARCH=`cat /etc/issue | cut -f 1 -d ' '`
  case $ARCH in
    "Arch")
      PM="pacman -S "
      ;;
    "Debian")
      PM="apt-get install "
      ;;
    "Ubuntu")
      PM="apt-get install "
      ;;
    *)
      return 1
      ;;
  esac

}

function usage
{
  echo -e '\e[30m\e[43mTODO\e[49m\e[39m : implement the usage function of this script.'
}

###
#  This function parse the options given to this script.
###
function parse_args
{
  while :; do
    case $1 in
      -h|--help)
        usage
        exit 0
        ;;
      --no-install)
        INSTALL_PACKAGES=0
        ;;
      --vim)
        INSTALL_VIM=1
        ;;
      --xmonad)
        INSTALL_XMONAD=1
        ;;
      --xmobar)
        INSTALL_XMOBAR=1
        ;;
      --livedown)
        INSTALL_LIVEDOWN=1
        ;;
      -a|--all)
        full_install
        ;;
      --rust)
        INSTALL_RUST= 1
        ;;
      *)
        break
    esac
    shift
  done
}

##########################################
# Installation functions
##########################################

function install_packages
{
  get_package_manager
  if [ $? -eq 1 ]
  then
    echo -e '\e[31mThere is a problem determining which package manager you are using, so the installation cannot be done.\e[39m'
    return 1
  fi
  echo 'Installation of all the dependancies.'
  su -c "$PM $ALL"
  echo 'All the needed packages have been installed.'
}

function full_install
{
  echo -e '\e[34mStarting the complete configuration\e[39m'

  install_packages || {
    echo -e '\e[31mAn error occured during the \e[1mpackages\e[21m installation.\e[39m'
    exit 1
  }

  echo '-----------------------'

  install_vim || {
    echo -e '\e[31mAn error occured during the \e[1mvim\e[21m configuration.\e[39m'
    exit 1
  }

  echo '-----------------------'

  install_xmobar || {
    echo -e '\e[31mAn error occured during the \e[1mXMobar\e[21m configuration.\e[39m'
    exit 1
  }

  echo '-----------------------'

  install_xmonad || {
    echo -e '\e[31mAn error occured during the \e[1mXMonad\e[21m configuration.\e[39m'
    exit 1
  }

  echo '-----------------------'

  install_livedown || {
    echo -e '\e[31mAn error occured during the \e[1mLivedown\e[21m installation.\e[39m'
  }

  echo -e '\e[34mThe configuration has finish without error.\e[39m'
  exit 0
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

  # Checking if the xinitrc file is already configured for xmonad
  grep 'exec xmonad' $HOME/.xinitrc > /dev/null
  if [[ $? -eq 1 ]]
  then
    echo 'exec xmonad' >> $HOME/.xinitrc
  fi
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

if [[ $@ = "" ]]
then
  usage
  exit 0
fi

parse_args $@

if [ $INSTALL_PACKAGES -eq 1 ]
then
  install_packages || {
    echo -e '\e[31mAn error occured during the \e[1mpackages\e[21m installation.\e[39m'
    exit 1
  }

  echo '-----------------------'
fi

if [ $INSTALL_VIM -eq 1 ]
then
  install_vim || {
    echo -e '\e[31mAn error occured during the \e[1mvim\e[21m configuration.\e[39m'
    exit 1
  }

  echo '-----------------------'
fi

if [ $INSTALL_XMOBAR -eq 1 ]
then
  install_xmobar || {
    echo -e '\e[31mAn error occured during the \e[1mXMobar\e[21m configuration.\e[39m'
    exit 1
  }

  echo '-----------------------'
fi

if [ $INSTALL_XMONAD -eq 1 ]
then
  install_xmonad || {
    echo -e '\e[31mAn error occured during the \e[1mXMonad\e[21m configuration.\e[39m'
    exit 1
  }

  echo '-----------------------'
fi

if [ $INSTALL_LIVEDOWN -eq 1 ]
then
  install_livedown || {
    echo -e '\e[31mAn error occured during the \e[1mLivedown\e[21m installation.\e[39m'
  }

  echo '-----------------------'
fi

echo -e '\e[34mThe configuration has finish without error.\e[39m'

exit 0
