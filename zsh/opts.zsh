#Name:   opts.zsh
#Author: Challsted
#Source: https://github.com/challsted/dotfiles
#
#Purpose: This file is to be source from the ~/.zshrc file and its purpose is to setup additional options (supplied by OHZsh)
####################
# User configuration
####################

#HISTORY
# multiple zsh sessions will append to the same history file (incrementally, after each command is executed)
setopt inc_append_history
# purge duplicates first
setopt hist_expire_dups_first
# if a new command line being added to the history list duplicates an older one, the older command is removed from the list
setopt hist_ignore_all_dups
# reduce unnecessary blanks from commands being written to history
setopt hist_reduce_blanks
# import new commands from history (mostly)
setopt share_history

#COMMAND COMPLETION
# treat `#', `~' and `^' characters as part of patterns for filename generation
setopt extended_glob
# case insensitive matching when performing filename expansion
setopt no_case_glob
# if command not found, but directory found, cd into this directory
setopt auto_cd
# turn off automatic matching of ~/ directories (speeds things up)
setopt no_cdable_vars
# perform implicit tees or cats when multiple redirections are attempted
setopt multios
# do not send the HUP signal to background jobs on shell exit
setopt no_hup
# parameter expansion, command substitution and arithmetic expansion are performed in prompts
setopt prompt_subst
# Prevents Multiple copies of a dir in your pushd
setopt pushd_ignore_dups
# Shows a completion menu after tab is pressed must be paired with "unsetopt menu_complete"
setopt auto_menu
unsetopt menu_complete

#CORRECTIONS
#Spelling Correction for Commands then for Arguments (next 2 lines)
setopt correct
setopt correctall

