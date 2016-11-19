#Name    alias.zsh
#Author: CHallsted
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
fi

#Application Stuff
#Set top to htop only if htop is installed
if type htop > /dev/null; then
    alias top="htop" #Allows for htop to run if i type top instead
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
