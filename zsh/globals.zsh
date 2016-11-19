#globals.zsh
#Author: CHallsted
#Source: https://github.com/challsted/dotfiles
#
#Purpose: This file is to be source from the ~/.zshrc file and its purpose is to keep as many of the "Global" changes as possible in 1 spot.

#ONLY UPDATE PATH FROM HERE
PATH="/usr/local/heroku/bin:~/.config/bspwm/:$PATH"

#Attempts to set xterm to xterm-256 colors
#This works for xfce4-terminal
case "$TERM" in
    xterm*) TERM=xterm-256color
esac

# Preferred editor if I'm ssh'd to somewhere
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
fi

#Export ssh keys
export SSH_KEY_PATH="~/.ssh/"

# Set multiple values ONLY if NVim is installed
# Set MANPAGER to open man pages in NVim or Vim
# Set system wide EDITOR and GIT_EDITOR as appropriate
# Enable Edit Inline Command, conditionally with nvim
# Alias "vi" to NeoVim, leaving "vim" to open vim
if type nvim > /dev/null; then
    export MANPAGER="env MAN_PN=1 nvim -M +MANPAGER -"
    export EDITOR="nvim"
    export GIT_EDITOR="nvim"
    export VISUAL="nvim"
    alias vi="nvim"
else
    export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
    export EDITOR="vim"
    export GIT_EDITOR="vim"
    export VISUAL="vim"
    alias vi="vim"
fi

#This sets the keyboard layout to QWERTY, but after pressing the right control and the right shift (at the same time) key it toggles the keyboard layout to be Dvoark
#It also turns the CAPS LOCK Key into a Control Key
#It Also turns on/off the Scroll Lock LED Off = QWERTY On=Dvorak
#Secondly, it turns caps lock (if held) into a ctrl key
if type setxkbmap > /dev/null; then
    setxkbmap -layout "us,us" -variant ",dvorak" -option "grp:rctrl_rshift_toggle,grp_led:scroll,caps:ctrl_modifier"
    setxkbmap -option 'caps:ctrl_modifier'
fi

# This turns caps lock (if only pressed) into Esc
# github.com/alols/xcape
if type xcape > /dev/null; then
    xcape -e 'Caps_Lock=Escape'
fi

# Enable RBEnv on boot
# github.com/rbenv/rbenv
if type rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# For somereason Im having issues where my XDG's are not set...
 if [ -z $XDG_CONFIG_HOME ]; then
     export XDG_CONFIG_HOME="$HOME/.config"
 fi
