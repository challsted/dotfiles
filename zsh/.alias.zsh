#.alias.zsh
#Version 1.2
#Author: Hackinginfo
#Source: https://github.com/hackinginformation/dotfiles
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
alias ubuntuupdate="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove"  #Fully Update Ubuntu, assumes yes, except for auto-remove
alias ubinstall="sudo apt-get install $2" #install stuff with 1 word prefix
alias ubremove="sudo apt-get remove $2" #Remove stuff with 1 word prefix

#ZSH Commands to make editing stuff easier
alias configzsh="vim ~/.zshrc"  #One command to edit main config file from anywhere
alias sourcezsh="source ~/.zshrc"  #One command to source the main config file from anywhere (. .zshrc equivilent from bash) 

#SSH Stuff
alias sshx="ssh -c arcfour,blowfish -XC" #Add a connection and a thing you want forwarded to user this

#GIT Stuff
alias gs="git status"
alias ga="git add ." #Add current dir to git queue
alias gA="git add -A" #Add everything, adds, deletes, changes to the git queue
alias gc="git commit -m" #Commits current queue to git. Requires you to type a commit message
alias gp="git pull" #Pulls the updates from remote to local
alias gP="git push origin" #Pushs to remote branch (given after gP) ex. gP master will git push origin master
alias co="git checkout" #Checks out a branch given after co
alias cod="git checkout development" #Checks out the development branch
alias cop="git checkout puppetdev" #Checks out the puppetdev branch
export GIT_EDITOR=vim #Export git commit message editor (if you dont use -m)

#Application Stuff
alias top="htop" #Allows for htop to run if i type top instead
alias nvim="nocorrect nvim" #This is to prevent auto correction of nvim to vim

#TMux Stuff
alias tmux="TERM=screen-256color-bce tmux"

#Add Custom bin dir
export PATH=$HOME/bin/:$PATH

#mps-youtube
alias youtube="mpsyt"
alias youtube-update="sudo pip install mps-youtube --upgrade"

#Stupid Stuff
alias doit="sudo !!"
