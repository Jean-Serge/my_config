# Vi(mproved) configuration

![Vim Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/langfr-200px-Vimlogo.svg.png?uselang=fr)

*Vim* is a very configurable and light text editor, it's base on the *vi* editor which is provided natively by almost all of the UNIX systems.

This repo contains configuration files for *vim*. It will install *Vundle*, a bundle manager for *vim*. 

## Requirements

+ *vim* 
+ *git* (even if it must have already been installed for cloning this project)

## Installation

You can install it using the **install.bash** script at the root of this project. If you just want to install my *Vim* configuration, simply run 

	./install.bash --vim

This script will copy the vim configuration to your $HOME repertory.
Then it will clone the Vundle repo and automatically install it into *vim*.

**Warning : this script will change all your vim configuration and potentially delete it!**
**You can also just use some of those files for making your own custom configuration, mine is just an example.**
 
## Configuration

+ Automaticaly indent when starting a new line
+ Enable the syntax coloration
+ Print line number

*Note : You can add new Vundle plugins by modifying the **vim/.vimrc** file (see the Vundle.vim github repo to have some example of plugins frequently used).*

## Links :

+ [Official website](http://vim.org)
+ [Vundle Github](https://github.com/VundleVim/Vundle.vim)
