####################
# User configuration
####################

# result of last command displays either happy or sad face as a prompt
smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

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
