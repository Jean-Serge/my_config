# Configuration XTerm

XTerm is the (very light) default terminal emulator for *Xorg* Window System.
I have choose it because it is configurable enough for me and I don't really see diference between it and other terminal emulator.

## Requirement

+ You need (guess what) *xterm* and *xrdb* for install this configuration.


	# On ArchLinux
	pacman -S xterm xorg-xrdb

## Installation

Run

	./install.bash

OR directly (in the xterm directory)

	xrdb -merge .Xresources

## Configuration

+ Change the foreground and background color : 
	+ white foreground
	+ black background
	
+ Change font *(I found default font unreadable)*:
	+ Font : **Deja Vu Mono**
	+ Size : **13**
	+ Anti-Aliasing : **true**

## Links

+ ArchLinux-XTerm page : https://wiki.archlinux.org/index.php/Xterm
