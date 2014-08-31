######################
# OMZsh Configuration
# Auto Generated
# Removed all the crap
######################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
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

#multiple zsh sessions will append to the same history file (incrementally, after each command is executed)
setopt inc_append_history
#purge duplicates first
setopt hist_expire_dups_first
#if a new command line being added to the history list duplicates an older one, the older command is removed from the list
setopt hist_ignore_all_dups
#reduce unnecessary blanks from commands being written to history
setopt hist_reduce_blanks
#import new commands from history (mostly)
setopt share_history

#COMMAND COMPLETION
#treat `#', `~' and `^' characters as part of patterns for filename generation
setopt extended_glob
#case insensitive matching when performing filename expansion
setopt no_case_glob
#if command not found, but directory found, cd into this directory
setopt auto_cd
#turn off automatic matching of ~/ directories (speeds things up)
setopt no_cdable_vars
#perform implicit tees or cats when multiple redirections are attempted
setopt multios
#do not send the HUP signal to backround jobs on shell exit
setopt no_hup
#parameter expansion, command substitution and arithmetic expansion are performed in prompts
setopt prompt_subst

### {{ Keybindings for VI mode
case "$TERM" in
 *xterm*|screen-256color)
 # alt + arrows
 bindkey '[D' backward-word
 bindkey '[C' forward-word
 bindkey '^[[1;3D' backward-word
 bindkey '^[[1;3C' forward-word
 # ctrl + arrows
 bindkey '^[OD' backward-word
 bindkey '^[OC' forward-word
 bindkey '^[[1;5D' backward-word
 bindkey '^[[1;5C' forward-word
 # home / end
 bindkey '^[[1~' beginning-of-line
 bindkey '^[[4~' end-of-line
 # delete
 bindkey '^[[3~' delete-char
 # page up / page down
 bindkey '^[[5~' history-beginning-search-backward
 bindkey '^[[6~' history-beginning-search-forward
 # shift + tab
 bindkey '^[[Z' reverse-menu-complete
 # VI MODE KEYBINDINGS (ins mode)
 bindkey -M viins '^a' beginning-of-line
 bindkey -M viins '^e' end-of-line
 bindkey -M viins -s '^b' "←\n" # C-b move to previous directory (in history)
 bindkey -M viins -s '^f' "→\n" # C-f move to next directory (in history)
 bindkey -M viins '^k' kill-line
 bindkey -M viins '^r' history-incremental-pattern-search-backward
 bindkey -M viins '^s' history-incremental-pattern-search-forward
 bindkey -M viins '^o' history-beginning-search-backward
 bindkey -M viins '^p' history-beginning-search-backward
 bindkey -M viins '^n' history-beginning-search-forward
 bindkey -M viins '^y' yank
 bindkey -M viins '^w' backward-kill-word
 bindkey -M viins '^u' backward-kill-line
 bindkey -M viins '^h' backward-delete-char
 bindkey -M viins '^?' backward-delete-char
 bindkey -M viins '^_' undo
 bindkey -M viins '^x^l' history-beginning-search-backward-then-append
 bindkey -M viins '^x^r' redisplay
 bindkey -M viins '\eOH' beginning-of-line # Home
 bindkey -M viins '\eOF' end-of-line # End
 bindkey -M viins '\e[2~' overwrite-mode # Insert
# VI MODE KEYBINDINGS (cmd mode)
 bindkey -M vicmd 'ca' change-around
 bindkey -M vicmd 'ci' change-in
 bindkey -M vicmd 'da' delete-around
 bindkey -M vicmd 'di' delete-in
 bindkey -M vicmd 'ga' what-cursor-position
 bindkey -M vicmd 'gg' beginning-of-history
 bindkey -M vicmd 'G ' end-of-history
 bindkey -M vicmd '^a' beginning-of-line
 bindkey -M vicmd '^e' end-of-line
 bindkey -M vicmd '^k' kill-line
 bindkey -M vicmd '^r' history-incremental-pattern-search-backward
 bindkey -M vicmd '^s' history-incremental-pattern-search-forward
 bindkey -M vicmd '^o' history-beginning-search-backward
 bindkey -M vicmd '^p' history-beginning-search-backward
 bindkey -M vicmd '^n' history-beginning-search-forward
 bindkey -M vicmd '^y' yank
 bindkey -M vicmd '^w' backward-kill-word
 bindkey -M vicmd '^u' backward-kill-line
 bindkey -M vicmd '/' vi-history-search-forward
 bindkey -M vicmd '?' vi-history-search-backward
 bindkey -M vicmd '^_' undo
 bindkey -M vicmd '\ef' forward-word # Alt-f
 bindkey -M vicmd '\eb' backward-word # Alt-b
 bindkey -M vicmd '\ed' kill-word # Alt-d
 bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
 bindkey -M vicmd '\e[6~' history-beginning-search-forward # PageDown
;;
esac
### }}

# result of last command displays either happy or sad face as a prompt
smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

#{{ Scripts

## SSH Stuff {{
# Preferred editor if im ssh'd to somewhere
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

#Export ssh keys
export SSH_KEY_PATH="~/.ssh/"

#Online indicator in prompt (https://gist.github.com/remy/6079223)
ONLINE='%{%F{green}%}◉'
OFFLINE='%{%F{red}%}⦿'

function ssh_prompt_color() {
 if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  echo '%{%F{blue}%}'
 else
  echo '%{%F{green}%}'
 fi
}
##}}

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

#Export git commit message editor
export GIT_EDITOR=vim

#Set line edit mode to vi, since vi plugin sucks, change settings to make it smoother and easier
bindkey -v
export KEYTIMEOUT=1
zle -N zle-line-init

#Vi mode prompt shown on screen ###Test 1###
function zle-line-init zle-keymap-select {
 VIM_PROMPT_CMD="%{$fg_bold[green]%} [% COMMAND]% %{$reset_color%}"
 vim_mode=$VIM_PROMPT_CMD
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT_CMD}/(main|viins)/}"
  zle reset-prompt
} 

##{{ Custom Prompt
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}' #Shows User@Host
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'  #Shows current directory, bold, 
local git_branch='$(git_prompt_info)%{$reset_color%}'                #Shows the current gitbranch from the builtin
local current_dir_2='%{$fg[blue]%}%~%{$reset_color%}'                #Differnt way to show the current dir
PROMPT="╭─${user_host} ${current_dir} 
╰─%B$%b " #Insert Bold "$"
RPROMPT="${smiley} ${git_branch}"
#}}

#{{ Custom Alias's and Override alias's
alias ll="ls -larth"  #All files, "long" with reverse time sorting and human readable sizes
alias ubuntuupdate="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove"  #Fully Update Ubuntu
alias configzsh="vim ~/.zshrc"  #One command to edit this file from anywhere
alias sourcezsh="source ~/.zshrc"  #One command to source this file from anywhere (. .zshrc equivilent from bash) 
alias carter_laptop="ssh -t carter_laptop 'exec zsh'" #Pulls from ~/.ssh/config
alias apt-get install="sudo apt-get install $@" ##Currently Not Working
alias gs="git status"
alias ga="git add ." #Add current dir to git queue
alias gc="git commit -m" #Commits current queue to git. Requires you to type a commit message
alias gp="git push" #Pushes current queue to git repo.

#}} 
