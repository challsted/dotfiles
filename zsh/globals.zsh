#globals.zsh
#Author: CHallsted
#Source: https://github.com/challsted/dotfiles
#
#Purpose: This file is to be source from the ~/.zshrc file and its purpose is to keep as many of the "Global" changes as possible in 1 spot.

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
# Alias "vi" to NeoVim, leaving "vim" to open vim
if type nvim > /dev/null; then
    export MANPAGER="env MAN_PN=1 nvim -M +MANPAGER -"
    export EDITOR="nvim"
    export GIT_EDITOR="nvim"
    alias vi="nvim"
else
    export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
    export EDITOR="vim"
    export GIT_EDITOR="vim"
fi
