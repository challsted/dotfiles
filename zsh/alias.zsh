#.alias.zsh
#Author: Hackinginfo
#Source: https://github.com/challsted/dotfiles
#
#Purpose: This file is to be source from the ~/.zshrc file and its purpose is supply the end user with a series of usable alias's and some humorous alias's
###################
# A single file for all of the alias commands to be in 1 place
###################

#Directory Stuff
alias ll="ls -larth"  #All files, "long" with reverse time sorting and human readable sizes; added colros for terminals that dont auto do this
alias lh="ls -d .*" # ONLY show hidden files/folders this is genius (stolen); added colors for terminals that dont auto do this
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" #Stolen from the Internet, makes a tree out of current dirs

#OS Specific
# TODO [Enhancement] Has OS - Write Function to test what OS user is on
# TODO [Dependency] e<thing> (OS Specific) - This relies on hasOS function being written
# TODO [Testing] e<thing> (OS Specific) Need to test this on all OS's I run
#eupdate - easy update
#einstall - easy install
#eremove - easy remove
if [[ -z $UBUNTU ]]; then
    alias eupdate="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove"  #Fully Update Ubuntu, assumes yes, except for auto-remove
    alias einstall="sudo apt-get install $2" #install stuff with 1 word prefix
    alias eremove="sudo apt-get remove $2" #Remove stuff with 1 word prefix
elif [[ -z $FEDORA ]]; then
    alias eupdate="sudo dnf update && sudo dnf upgrade"
    alias einstall="sudo dnf install $2"
    alias eremove="sudo dnf remove $2"
elif [[ -z $ARCH ]]; then
    alias eupdate="temp value"
    alias einstall="temp value"
    alias eremove="temp value"
elif [[ -z $GENTOO ]]; then
    alias eupdate="temp value"
    alias einstall="temp value"
    alias eremove="temp value"
else
    alias eupdate="echo no idea what your running!"
    alias einstall="echo no idea what your running!"
    alias eremove="echo no idea what your running!"
fi

#SSH Stuff
# TODO [Testing] sshx - Validate this even works
alias sshx="ssh -c arcfour,blowfish -XC" #Add a connection and a thing you want forwarded to user this

#Git Stuff
# TODO [Testing] git aliases - validate all of these work
if type git > /dev/null; then
    alias gs="git status"
    alias ga="git add $2" #ga <file name>. Add file name after ga
    alias gA="git add -A" #Add everything, adds, deletes, changes to the git queue
    alias gc="git commit" #Commits current queue to git. Requires you to type a commit message
    alias gp="git pull" #Pulls the updates from remote to local
    alias co="git checkout $2" #Checks out a branch given after co
    alias cod="git checkout development" #Checks out the development branch
    alias com="git checkout master" #Checks out the master branch
    alias cop="git checkout production" #Checks out the production branch
    alias pullall="for REPO in `find ~/git -maxdepth 1 -type d`; do (cd "$REPO" && git pull origin master); done;" #Pull everything down!!! (Experimental)
fi

#Application Stuff
#Set top to htop only if htop is installed
if type htop > /dev/null; then
    alias top="htop" #Allows for htop to run if i type top instead
fi

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

#TMux Stuff
if type tmux > /dev/null; then
    alias ntmux="tmux new-session -s $2" #Allows you to type "ntmux <random>" and it will open a new tmux session
    alias atmux="tmux attach-session -t $2" #Allows you to attach to a tmux session at willA
    alias ltmux="tmux list-sessions" #An easy way to list available tmux sessions
fi

#Random Applications
#If you want this, install with: pip install mps-youtube
if type mpsyt > /dev/null; then
    alias youtube="mpsyt"
    alias youtube-update="sudo pip install mps-youtube --upgrade"
fi

#Stupid Stuff
alias doit="sudo !!"
