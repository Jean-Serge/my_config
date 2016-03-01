# XMonad configuration

*XMonad* is a tiling Window Manager, directly written for *X*. I choose it to make a keyboard-only-managing interface. XMonad is very ligh and came all alone, unlike *Graphical Environement* (Gnome, KDE, XFCE, LXDE, ...) that came with a lot of compatible applications.

*XMonad* allow user to easily launch multiple windows and move them according to personalized layout. Another advantage is tha *XMonad* natively works with multi-screen computers.

## Configuration
+ Changing the "mod" key to the *windows* key (instead of *Alt*)
+ Changing the shortcut reducing the number of window in the master frame to *Shift+Mod+,*
+ Adding parameters to the *xterm* command line called with XMonad
+ Adding the xmobar call to xmonad
+ Calling dmenu when pressing *Mod+p*
+ Changing the *switch-workspace* shortcut to bind it to my azerty keyboard (changing '1' to '&', '2' to 'é', ...)
+ Adding a shortcut *Mod+Shift+L* calling `xscreensaver-command --lock` to lock the screen 

## Applications
My XMonad configuration is based on some other applications :
+ *dmenu*, (an application launch-bar)
+ *Xterm*, the basic X terminal simulator (see the root **README.md** of the project)
+ *XMobar*, a status bar (see the **xmobar** directory for further information)

## Links
+ Official site : http://xmonad.org
+ Arch-wiki page : https://wiki.archlinux.org/index.php/Xmonad
+ Arch-wiki page (fr) : https://wiki.archlinux.fr/Xmonad 
+ Arch-wiki page for DMenu : https://wiki.archlinux.org/index.php/Dmenu
