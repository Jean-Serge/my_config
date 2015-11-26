#My computer configuration

Content
=======
This git contains configuration files for :
+ *vim*
+ *XMonad*
+ *XMobar*

Vi(mproved)
-----------
*Vim* is a very configurable and light text editor, it's base on the *vi* editor which is provided natively by almost all of the UNIX systems.

**Features :**
I installed *Vundle* which is a *Vim* plugin manager. It allow you to easily install plugin for *vim*.

**links :**
+ Official website : http://vim.org
+ Vundle git : https://github.com/VundleVim/Vundle.vim

XMonad
------
*XMonad* is a lightly tiling Windows Manager (WM). Written in Haskell, it's very configurable but maybe not simplest. However you don't need to know Haskell to configure it (fortunately for me).

**Applications used :**
+ XMobar
+ dmenu (light app launcher bar)
+ XTerm

**links :**
+ Official website : http://xmonad.org
+ Archlinux wiki : https://wiki.archlinux.org/index.php/Xmonad
+ French (but lightest) version : https://wiki.archlinux.fr/Xmonad


XMobar
------
*XMobar* is a minimal status bar, very effective on tiling Windows Manager like *XMonad* (see up there) or *Awesome*.

**links :**
+ Official website : http://projects.haskell.orf/xmobar


How to use those files
======================
Just create a symbolic link from one of them to your $HOME
*ex : ln -s .vimrc ${HOME}/.vimrc
