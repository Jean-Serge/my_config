<!-- # My computer configuration -->

# Introduction 

Here is my computer configuration. For this project, I aimed to build a light but fully operating system. 
My computer run on ArchLinux but this should be portable on many Linux OS.

At first I created this repo for 2 reasons :
+ Keep my configuration on a remote platform (to get it back regardless of the computer from where I work)
+ Improve my git skill on a long-time project (yes it is)

If you want to advise me (about git or about any configuration), you are welcome. You can contact me on my github e-mail address.


# List of Content

This git contains configuration files for :
+ *vim*
+ *XMonad*
+ *XMobar*

(For further information, look at the repertory of this applications)

# XMonad

*XMonad* is a lightly tiling Windows Manager (WM). Written in Haskell, it's very configurable but maybe not simplest. However you don't need to know Haskell to configure it (fortunately for me).

## Applications used :
+ XMobar
+ dmenu (light app launcher bar)
+ XTerm

## Links :
+ Official website : http://xmonad.org
+ Archlinux wiki : https://wiki.archlinux.org/index.php/Xmonad
+ French (but lightest) version : https://wiki.archlinux.fr/Xmonad

# Livedown

Livedown is a tool for Markdown-file preview in browser. You just have to start livedown specifying it your file and your browser. It will open this file in your browser and actualize the page each time you save the file.

## Installation
+ Install *npm* with your package manager
+ Install *livedown* : * **npm install -g livedown** *

## Utilisation example :
+ * **livedown start README.md --open --browser firefox** *
+ * **vim README.md** *

