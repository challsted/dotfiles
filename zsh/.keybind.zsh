# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

#Below was copied during search to setup vi keys in zsh

# Keybindings for VI mode
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
 bindkey -M viins -s '^b' "←\n"                                         # C-b move to previous directory (in history)
 bindkey -M viins -s '^f' "→\n"                                         # C-f move to next directory (in history)
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
 bindkey -M viins '^_' undo                                             #Ctrl-_
 bindkey -M viins '^x^l' history-beginning-search-backward-then-append  #Ctrl-x,Ctrl-l
 bindkey -M viins '^x^r' redisplay                                      #Ctrl-x,Ctrl-r
 bindkey -M viins '\eOH' beginning-of-line                              #Home
 bindkey -M viins '\eOF' end-of-line                                    #End
 bindkey -M viins '\e[2~' overwrite-mode                                #Insert
# VI MODE KEYBINDINGS (cmd mode)
 bindkey -M vicmd 'ca' change-around                                    #ca
 bindkey -M vicmd 'ci' change-in                                        #ci
 bindkey -M vicmd 'da' delete-around                                    #da
 bindkey -M vicmd 'di' delete-in                                        #di
 bindkey -M vicmd 'ga' what-cursor-position                             #ga
 bindkey -M vicmd 'gg' beginning-of-history                             #gg
 bindkey -M vicmd 'G ' end-of-history                                   #G
 bindkey -M vicmd '^a' beginning-of-line                                #Ctrl-a
 bindkey -M vicmd '^e' end-of-line                                      #Ctrl-e
 bindkey -M vicmd '^k' kill-line                                        #Ctrl-k
 bindkey -M vicmd '^r' history-incremental-pattern-search-backward      #Ctrl-r
 bindkey -M vicmd '^s' history-incremental-pattern-search-forward       #Ctrl-s
 bindkey -M vicmd '^o' history-beginning-search-backward                #Ctrl-o
 bindkey -M vicmd '^p' history-beginning-search-backward                #Ctrl-p
 bindkey -M vicmd '^n' history-beginning-search-forward                 #Ctrl-n
 bindkey -M vicmd '^y' yank                                             #Ctrl-y
 bindkey -M vicmd '^w' backward-kill-word                               #Ctrl-w
 bindkey -M vicmd '^u' backward-kill-line                               #Ctrl-u
 bindkey -M vicmd '/' vi-history-search-forward                         #/
 bindkey -M vicmd '?' vi-history-search-backward                        #?
 bindkey -M vicmd '^_' undo                                             #Ctrl-_
 bindkey -M vicmd '\ef' forward-word                                    #Alt-f
 bindkey -M vicmd '\eb' backward-word                                   #Alt-b
 bindkey -M vicmd '\ed' kill-word                                       #Alt-d
 bindkey -M vicmd '\e[5~' history-beginning-search-backward             #PageUp
 bindkey -M vicmd '\e[6~' history-beginning-search-forward              #PageDown
;;
esac

