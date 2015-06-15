#.prompt.zsh
#Version 1.1 - Starting this number now, no idea how many modifications have gone into this...
#Author: Hackinginfo
#Source: https://github.com/hackinginformation/dotfiles
#
#Purpose: This file is to be source from the ~/.zshrc file and its purpose is to present the user with a nice looking custom prompt

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

local host='%{$terminfo[bold]$fg[green]%}%m%{$reset_color%}' #Shows Host
local git_branch='$(git_prompt_info)%{$reset_color%}'                #Shows the current gitbranch from the builtin
local current_dir_2='%{$fg[red]%}%~%{$reset_color%}'                #Differnt way to show the current dir
PROMPT="╭─${host} ${current_dir_2} 
╰─%B$%b " #Insert Bold "$"
RPROMPT="${git_branch}"
