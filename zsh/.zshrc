######################
# OMZsh Configuration
# Auto Generated
# Removed all the crap
######################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git command-not-found sudo vi-mode web-search wd colored-man colorize cp emoji-clock lol nyan rand-quote)

source $ZSH/oh-my-zsh.sh

####################
# User configuration
####################

#{{ Scripts

# Preferred editor if im ssh'd to somewhere
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/"

# Alt-S inserts "sudo " at the start of the line
insert_sudo () {
	zle beginnng-of-line ; zle -U "sudo " }
	zle -N insert-sudo insert_sudo
	bindkey "^[s" insert-sudo

#Explode the following formats by typeing ex $1
ex () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xjf $1 ;;
			*.tar.gz) tar xzf $1 ;;
			*.bz2) bunzip2 $1 ;;
			*.rar) rar x $1 ;;
			*.gz) gunzip $1 ;;
			*.tar) tar xf $1 ;;
			*.tbz2) tar xjf $1 ;;
			*.tgz) tar xzf $1 ;;
			*.zip) unzip $1 ;;
			*.Z) uncompress $1 ;;
			*.7z) 7z x $1 ;;
			*) echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' if not a valid file"
	fi
}

# }}

# {{ Custom Alias's and Override alias's
alias ll="ls -larth"  #All files, "long" with reverse time sorting and human readable sizes
alias ubuntuupdate="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove"  #Fully Update Ubuntu
alias zshconfig="vim ~/.zshrc"  #One command to edit this file from anywhere
alias sourcezsh="source ~/.zshrc"  #One command to source this file from anywhere (. .zshrc equivilent from bash) 

# }} 
