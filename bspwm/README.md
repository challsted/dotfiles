[BSPWM](https://github.com/baskerville/bspwm)
=====

This folder of this repo is to keep all config for my jump into BSPWM (Binary Space Partitioning Window Manager)

# Extra Packages Installed
* MPD and MPC - Music Player Daemon and a CLI client for MPD
  * obtained though DNF
* feh - image fiewer and cataloguer
  * obtained though DNF
* dmenu - a launcher
  * was already on my system because of i3
  * obtained though DNF
* dunst - notification manager
  * obtained from [here](https://github.com/knopwob/dunst)
* dzen - menu bar
  * also compiled "gadgets" under repo
  * obtained from [here](https://github.com/robm/dzen)
* sutils - Small CLI Utilities by Baskerville (maker of BSPWM)
  * obtained from [here](https://github.com/baskerville/sutils)

# Keybindings (NOT COMPLETE)
**Please note that this section MAY be out of date as I am still learning how to use this WM and am adding things more or less randomly right now**

All Config for Keybindings can be found under [sxhkdrc](https://github.com/challsted/dotfiles/blob/master/bspwm/sxhkdrc), and should be symlinked to `$XDG_CONFIG_HOME/sxhkd/sxhkdrc`


* `super + Return` - gnome-terminal - Launch Gnome Terminal

* `super + space` - dmenu_run - Program Launcher (need to get Rofi working)

* `super + Escape pkill -USR1 -x sxhkd` - Make sxhkd reload its configuration files:

* `super + alt + Escape` - bspc quit - Quit BSPWM normally

* `alt + w` - bspc window -c - Close Focused Window

* `alt + f` - ~/.config/bspwm/misc/full - Fullscreen current window

* `alt + shift + f` - ~/.config/bspwm/misc/floating - Float current window

* `alt + s` - bspc window -t sticky - Sticky current window

* `alt + s` - bspc window -t sticky - Sticky current window

* `alt + ctrl + f` - bspc window -s biggest - Move window to current biggest spot

* `alt + {_,shift + }{h,j,k,l}` - bspc node -{f,s} {west,south,north,east} - focus the node in the given direction

* `alt + ctrl + {h,j,k,l}` - bspc window -s {left,down,up,right} - Move window

* `super + ctrl + {h,j,k,l}` - bspc node -p {west,south,north,east} - preselect the direction

* `super + alt + {h,j,k,l}` - bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0} - expand a window by moving one of its side outward

* `super + alt + shift + {h,j,k,l}` - bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0} - contract a window by moving one of its side inward

* `alt + {Left,Down,Up,Right}` - bspc node -v {-20 0,0 20,0 -20,20 0} - move a floating window

* `alt + bracket{left,right}` - bspc desktop -f {prev,next} - Focus the next/prev desktop

* `alt + ctrl + {_,shift +}Tab` - bspc desktop -f {prev,next}

* `alt + {_,shift +}grave` - bspc desktop -f {next,prev}.occupied

* `alt + ctrl + {_,shift +}grave` bspc desktop -f {next,prev}
