<!-- # My computer configuration -->

# List of Content

This git contains configuration files for :
+ *vim*
+ *XMonad*
+ *XMobar*

# Vi(mproved)

*Vim* is a very configurable and light text editor, it's base on the *vi* editor which is provided natively by almost all of the UNIX systems.

## Features :
I installed *Vundle* which is a *Vim* plugin manager. It allow you to easily install plugin for *vim*.

## links :
+ Official website : http://vim.org
+ Vundle git : https://github.com/VundleVim/Vundle.vim

# XMonad

*XMonad* is a lightly tiling Windows Manager (WM). Written in Haskell, it's very configurable but maybe not simplest. However you don't need to know Haskell to configure it (fortunately for me).

## Applications used :
+ XMobar
+ dmenu (light app launcher bar)
+ XTerm

## links :
+ Official website : http://xmonad.org
+ Archlinux wiki : https://wiki.archlinux.org/index.php/Xmonad
+ French (but lightest) version : https://wiki.archlinux.fr/Xmonad


# XMobar

*XMobar* is a minimal status bar, very effective on tiling Windows Manager like *XMonad* (see up there) or *Awesome*.

## links :
+ Official website : http://projects.haskell.orf/xmobar

# Livedown

Livedown is a tool for Markdown-file preview in browser. You just have to start livedown specifying it your file and your browser. It will open this file in your browser and actualize the page each time you save the file.

## Installation
+ Install *npm* with your package manager
+ Install *livedown* : * **npm install -g livedown** *

## Utilisation example :
+ * **livedown start README.md --open --browser firefox** *
+ * **vim README.md** *

