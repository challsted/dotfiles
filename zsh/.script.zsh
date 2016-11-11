#.script.zsh
#Author: CHallsted
#Source: https://github.com/challsted/dotfiles
#
#Purpose: This file is to be source from the ~/.zshrc file and its purpose is for small functions and other clutter cluter you dont play with often

# Alt-S inserts "sudo " at the start of the line
insert_sudo () {
    zle beginnng-of-line ; zle -U "sudo "
}
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

#Explode the following formats by typing ex $1
ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)
                tar xvjf $1
                ;;
            *.tar.gz)
                tar xvzf $1
                ;;
            *.tar.xz)
                tar xvJf $1
                ;;
            *.tar.lzma)
                tar --lzma xvf $1
                ;;
            *.bz2)
                bunzip2 $1
                ;;
            *.rar)
                unrar $1
                ;;
            *.gz)
                gunzip $1
                ;;
            *.tar)
                tar xvf $1
                ;;
            *.tbz2)
                tar xvjf $1
                ;;
            *.tgz)
                tar xvzf $1
                ;;
            *.zip)
                unzip $1
                ;;
            *.Z)
                uncompress $1
                ;;
            *.7z)
                7z x $1
                ;;
            *)
                echo "'$1' cannot be extracted via extract()"
                ;;
        esac
    else
        echo "'$1' if not a valid file"
    fi
}

#Attempt at the ability to make a directory and imediatly cd into it!
function mkcd () {
    mkdir -p "$@" &&
        eval cd "\"\$$H\"";
}

#Attempts to set xterm to xterm-256 colors
#This works for xfce4-terminal
case "$TERM" in
    xterm*) TERM=xterm-256color
esac

#Prints a very nice looking "path" instead of the long string that is default
path() {
    echo $PATH | tr ":" "\n" | \
        awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
        sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
        sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
        sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
        sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
        print }"
}

# Preferred editor if im ssh'd to somewhere
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
fi

#Export ssh keys
export SSH_KEY_PATH="~/.ssh/"
export EDITOR=vim

# Easy Config Editor (Needs Work)
# TODO: Add i3wm
conf(){
    case $1 in
        zsh)
            $EDITOR ~/.zshrc && source ~/.zshrc
            ;;
        xinit)
            $EDITOR ~/.xinitrc
            ;;
        xres)
            $EDITOR ~/.Xresources && xrdb ~/.Xresources
            ;;
        tmux)
            $EDITOR ~/.tmux.conf
            ;;
        vim)
            $EDITOR ~/.vimrc
            ;;
        nvim)
            $EDITOR $XDG_CONFIG_HOME/nvim/init.vim
            ;;
        wmpanel)
            $EDITOR $XDG_CONFIG_HOME/bspwm/panel
            ;;
        wmbar)
            $EDITOR $XDG_CONFIG_HOME/bspwm/panel_bar
            ;;
        wmcolors)
            $EDITOR $XDG_CONFIG_HOME/bspwm/panel_colors
            ;;
        bsp)
            $EDITOR $XDG_CONFIG_HOME/bspwm/bspwmrc
            ;;
        sxhkd)
            $EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkd/sxhkdrc
            ;;
        *)
            echo -e "Sorry, you'll need to be more specific"
            ;;
    esac
}

# WORK IN PROGRESS - Easy Git(?)
# TODO: Look for a way to add a inline message
push(){
    case $1 in
        all)
            git init &&
                git -A &&
                git commit &&
                ;;
        here)
            git init &&
                git add . &&
                git commit &&
                ;;
        generic)
            git init &&
                git -A &&
                git commit -m "Generic Commit - Automated"&&
                ::
    esac
}

# WORK IN PROGRESS - Common CD Dirs
cdd(){
    case $1 in
        nvim)
            cd $XDG_CONFIG_HOME/nvim
            ;;
        dots)
            cd ~/git/dotfiles
            ;;
        bsp)
            cd $XDG_CONFIG_HOME/bspwm
            ;;
        sxhkd)
            cd $XDG_CONFIG_HOME/sxhkd
            ;;
        gnvim)
            cd ~/git/dotfiles/nvim
            ;;
        gvim)
            cd ~/git/dotfiles/vim
            ;;
        gtmux)
            cd ~/git/dotfiles/tmux
            ;;
        gzsh)
            cd ~/git/dotfiles/zsh
            ;;
        gbsp)
            cd ~/git/dotfiles/bspwm
            ;;
        gi3)
            cd ~/git/dotfiles/i3
            ;;
        *)
            echo -e "Sorry, you'll need to be more specific"
            ;;
    esac
}
