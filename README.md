<!-- # My computer configuration -->

# Introduction 

Here is my computer configuration. For this project, I aimed to build a light but fully operating system. 
My computer run on ArchLinux but this should be portable on many Linux OS.

I created this repo for some reasons :
+ Keep my configuration on a remote platform (to get it back regardless of the computer from where I work)
+ Improve my git skills on a long-time project (yes it is)
+ Improve my scripting skills

If you want to advise me (about git or about any configuration), you are welcome. You can contact me on my github e-mail address.

# Requirements

## Distributions

For the moment, all the root instructions of the **install.bash** script are ran with the *su* command so it will only work on certains distributions. I try to test it with others distributions than mine but I can be missing some bugs.

Tested distributions
+ Debian
+ ArchLinux

*Note : Even if the script works with Debian, it will not with Ubuntu due to the missing su command. The script should manage the sudo command in the future.*

## Language

This script is made by and for a french. It is made to run with an *AZERTY* keyboard, especially the *XMonad* configuration that uses *AZERTY* key-binding as shortcut.

# Installation

*Warning : this script use the content the **/etc/issue** file on your system to determinate which package manager you are using. Don't modify this file in order to make the script work correctly.*

Simply run 

	./install.bash

You can either completely install my configuration (with the `--all` option) or specify which part of it you want to install (for example with the `--vim` option).

# Applications used

+ [*vim*](vim/README.md) as main text editor
+ [*XMonad*](xmonad/README.md) as Window Manager
+ [*XMobar*](xmobar/README.md) as Status Bar
+ *Livedown* (see further) as MarkDown previewer
+ *XTerm* (see further) a default Terminal
+ *DMenu* as launch bar

# Livedown

Livedown is a tool for Markdown-file preview in browser. You just have to start livedown specifying it your file and your browser. It will open this file in your browser and actualize the page each time you save the file.

## Installation

Before installing *Livedown* you must install *npm*, the *NodeJS* Package Manager. 

	pacman -S --noconfirm npm
	npm install -g livedown

## Example

Using *Livedown* to write your **README.md** file and view it in *firefox*.

	livedown start --open --browser firefox README.md
	vim README.md

## Links
+ [NPM Website](https://www.npmjs.com/package/livedown)
+ [Livedown Github](https://github.com/shime/livedown)

# XTerm

XTerm is the (very light) default terminal emulator for *Xorg* Window System.
I chose it because it is configurable enough for me and I don't really see diference between it and other terminal emulator.

The XTerm configuration is directly made by passing parameters to the *Term* field in XMonad configuration.
  
## Installation

	pacman -S xterm xorg-xrdb

## Configuration

+ Colors : 
	+ grey foreground
	+ black background
	
+ Font :
	+ Font : **Deja Vu Mono**
	+ Size : **13**

## Links
+ ArchLinux-XTerm page : https://wiki.archlinux.org/index.php/Xterm
