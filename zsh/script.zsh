#Name:   script.zsh
#Author: CHallsted
#Source: https://github.com/challsted/dotfiles
#
#Purpose: This file is to be source from the ~/.zshrc file and its purpose is for small functions and other clutter you don't clogging up your main files
# Keybindings {{{
# Alt-S inserts "sudo " at the start of the line (ZSH Specific)
insert_sudo () {
    zle beginning-of-line ; zle -U "sudo "
}
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo
# }}}
# General Purpose/Helpful Functions {{{

#Attempt at the ability to make a directory and immediately cd into it!
mkcd () {
    mkdir -p "$@" &&
        eval cd "\"\$$H\"";
}

# A small function to check if a given  value is a number 
#   Bash doesn't have a clean way to do this that I can find
# Returns "0" if the value is NOT a number
# Returns "1" if the value is a number
isNum(){
    awk -v NUM="$1" 'BEGIN {print (NUM == NUM + 0)}';
}

#Prints a very nice looking "path" instead of the long string that is default
path() {
    echo "$PATH" | tr ":" "\n" | \
        awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
        sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
        sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
        sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
        sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
        print }"
}

#Explode the following formats by typing ex "$1"
ex () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)
                tar xvjf "$1"
                ;;
            *.tar.gz)
                tar xvzf "$1"
                ;;
            *.tar.xz)
                tar xvJf "$1"
                ;;
            *.tar.lzma)
                tar --lzma xvf "$1"
                ;;
            *.bz2)
                bunzip2 "$1"
                ;;
            *.rar)
                unrar "$1"
                ;;
            *.gz)
                gunzip "$1"
                ;;
            *.tar)
                tar xvf "$1"
                ;;
            *.tbz2)
                tar xvjf "$1"
                ;;
            *.tgz)
                tar xvzf "$1"
                ;;
            *.zip)
                unzip "$1"
                ;;
            *.Z)
                uncompress "$1"
                ;;
            *.7z)
                7z x "$1"
                ;;
            *)
                echo "'$1' cannot be extracted via extract()"
                ;;
        esac
    else
        echo "'$1' if not a valid file"
    fi
}

# }}}
# Stuff to edit other stuff easier {{{
# Easy Config Editor (Needs Work)
# TODO: [Enhancement] conf() Add i3wm
# TODO: [Enhancement] conf() Add (Neo)Mutt
conf(){
    case "$1" in
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
            $EDITOR "$XDG_CONFIG_HOME"/nvim/init.vim
            ;;
        wmpanel)
            $EDITOR "$XDG_CONFIG_HOME"/bspwm/panel
            ;;
        wmbar)
            $EDITOR "$XDG_CONFIG_HOME"/bspwm/panel_bar
            ;;
        wmcolors)
            $EDITOR "$XDG_CONFIG_HOME"/bspwm/panel_colors
            ;;
        bsp)
            $EDITOR "$XDG_CONFIG_HOME"/bspwm/bspwmrc
            ;;
        sxhkd)
            $EDITOR "$XDG_CONFIG_HOME"/sxhkd/sxhkd/sxhkdrc
            ;;
        *)
            echo -e "Sorry, you'll need to be more specific"
            ;;
    esac
}

# Easy CD to Commonly used Dir's
cdd(){
    case "$1" in
        nvim)
            cd "$XDG_CONFIG_HOME"/nvim || return
            ;;
        dots)
            cd ~/git/dotfiles || return
            ;;
        bsp)
            cd "$XDG_CONFIG_HOME"/bspwm || return
            ;;
        sxhkd)
            cd "$XDG_CONFIG_HOME"/sxhkd || return
            ;;
        gnvim)
            cd ~/git/dotfiles/nvim || return
            ;;
        gvim)
            cd ~/git/dotfiles/vim || return
            ;;
        gtmux)
            cd ~/git/dotfiles/tmux || return
            ;;
        gzsh)
            cd ~/git/dotfiles/zsh || return
            ;;
        gbsp)
            cd ~/git/dotfiles/bspwm || return
            ;;
        gi3)
            cd ~/git/dotfiles/i3 || return
            ;;
        *)
            echo -e "Sorry, you'll need to be more specific"
            ;;
    esac
}
#}}}
# If Git is installed {{{
if type git >/dev/null; then
    # You'll need to pass a directory of WHERE to pull all stuff from! (eg pullall . or pullall ~/git
    pullall(){
        for i in "$1"/*; do
            if [ -d "$i"/.git ]; then
                (
                echo "Pulling \"$i\" ..."
                cd "$i" || return
                git pull
                cd - &>/dev/null || return
                )
            fi
        done
    }

    gP(){
        while getopts ":h" OPT; do
            case $OPT in
                h)
                    echo "gP - or git push"
                    echo "Attempt at making a quicker way to preform git commands"
                    echo ""
                    echo "\"gP\"            - Running this command with no arguments, will perform a push to origin <branch your on>"
                    echo "                      - eg: If you are on the \"Master\" branch, running \"gp\" will run git push origin master"
                    echo "\"gp <branch>\"   - Passing a branch to gp will push to the branch you specificed"
                    echo "                      - eg: If you are on the Master Branch, but you want to push to you dev branch instead, you can run \"gP dev\""
                    echo ""
                    echo "Calling this command with more then 1 argument will cause a error"
                    return
                    ;;
                \?)
                    echo "Invalid Option: -$OPTARG" >&2
                    return
                    ;;
            esac
        done

        export GP_BRANCH_NAME
        GP_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

        if [[ $# -eq 0 ]]; then
            git push origin "$GP_BRANCH_NAME"
        elif [[ $# -eq 1 ]]; then
            git push origin "$1"
        else
            echo "You passed too many arguments!"
            echo "run gP -h if you need to know how to use this function"
        fi
    }
fi
# }}}
# If TMux is installed {{{
if type tmux > /dev/null; then
    qtmux(){
        # Use getopts to handle help, version, or any SINGLE LETTER arguments
        while getopts ":h" OPT; do
            case $OPT in
                h)
                    echo "Q(uick) TMux"
                    echo "Attempt at making a \"Quick TMux Session Manager\""
                    echo ""
                    echo "\"qtmux\"                 - Open a new session with the value given to \"QTMUX_SESSION_NAME\""
                    echo "                              - If a session with the default name already exists, it will attach instead" 
                    echo "\"qtmux <session_name>\"  - Attach to a pre-created session OR create a session with this name"
                    echo "                              - Also kind of does a fuzzy session attach if your session names are unique"
                    echo "\"qtmux <session_id>\"    - Attach to a pre-created session based on id (starting at 1)"
                    echo "                              - Will not create sessions!"
                    echo "\"qtmux -h\"              - You get this little help menu"
                    return
                    ;;
                \?)
                    echo "Invalid Option: -$OPTARG" >&2
                    return
                    ;;
            esac
        done
        QTMUX_SESSION_NAME="random" # Change this value if you want a different default name
        QTMUX_USER_INPUT="$1"
        QTMUX_IS_NUM=$(isNum "$1") #Checks if user passed in a number or a word, see "isNum()
        if [[ ! -z "$QTMUX_SESSION_NAME" ]]; then
            QTMUX_NAME_TAKEN=$(tmux list-sessions | grep "$QTMUX_SESSION_NAME" | wc -l 2> /dev/null)
        fi
        if [[ ! -z "$QTMUX_USER_INPUT" ]]; then
            QTMUX_SESSION_TAKEN=$(tmux list-sessions | grep "$QTMUX_USER_INPUT" 2> /dev/null)
        fi
        QTMUX_NUMBER=0

        if [[ "$QTMUX_IS_NUM" == "1" ]]; then
            QTMUX_NUMBER=1
        fi

        if [[ "$QTMUX_SESSION_TAKEN" ]]; then
            QTMUX_SESSION_FNAME=$(echo "$QTMUX_SESSION_TAKEN" | awk '{print "$1"}')
            QTMUX_SESSION_AVAILABLE=$(echo "$QTMUX_SESSION_FNAME" | wc -l)
        else
            QTMUX_SESSION_FNAME=$(echo "0")
            QTMUX_SESSION_AVAILABLE=0
        fi

        if [[ ! -z "$QTMUX_USER_INPUT" ]]; then # If user passes input
            if  [[ "$QTMUX_NUMBER" == "1" ]]; then # First check if the value given is a number (AKA session id)
                QTMUX_SESSION_FNAME=$(tmux list-sessions | awk -v QTMUX_AWK="$QTMUX_USER_INPUT" 'NR==QTMUX_AWK' | awk '{print "$1"}')
                QTMUX_SESSION_AVAILABLE=$(tmux list-sessions | awk -v QTMUX_AWK="$QTMUX_USER_INPUT" 'NR==QTMUX_AWK' | awk '{print "$1"}' | grep -v '^$' | wc -l)
                if [[ "$QTMUX_SESSION_AVAILABLE"  == "1" ]]; then # If there is a single session available, attach to it
                    tmux attach-session -t "$QTMUX_SESSION_FNAME"
                elif [[ "$QTMUX_SESSION_AVAILABLE"  -ge "2" ]]; then # If there is more then 1 session available, help the use out by showing them that
                    echo -e "I'm Sorry, but your search term was too ambiguous, please try something more specific"
                    echo -e "\tor maybe your sessions are named too similarly?"
                    echo -e "\nHere is the available results:\n"
                    echo -e "\t$(tmux list-sessions | grep \"$QTMUX_USER_INPUT\")"
                else # They passed a number, but its not one that we have available
                    echo -e "I'm sorry, the Session ID you passed: \n\t$QTMUX_USER_INPUT \nAppears to not exist"
                fi
            elif [[ "$QTMUX_SESSION_AVAILABLE"  == "1" ]]; then # If that name is an active session, connect to it
                tmux attach-session -t "$QTMUX_SESSION_FNAME"
            elif [[ "$QTMUX_SESSION_AVAILABLE"  -ge "2" ]]; then # If there is more then 1 session with that name, list them all
                echo -e "I'm Sorry, but your search term was too ambiguous, please try something more specific"
                echo -e "\tor maybe your sessions are named too similarly?"
                echo -e "\nHere is the available results:\n"
                echo -e "$(tmux list-sessions | grep \"$QTMUX_USER_INPUT\")"
            else # If sessions user listed is not available, ask if they want to create it
                echo "The Session name you entered dosnt exist, would you like to create it now?"
                echo "Y/n"
                read -r YN
                case "$YN" in
                    [yY] | [yY][eE][sS] )
                        tmux new-session -s "$QTMUX_USER_INPUT"
                        ;;
                    [nN] | [nN][oO] )
                        echo -e "Ok, not creating that for you then"
                        ;;
                    *)
                        echo -e "Dont know what you just told me to do, breaking instead"
                        ;;
                esac
            fi
        elif [[ ! -z "$QTMUX_NAME_TAKEN" ]]; then # If the use did not pass input BUT the QTMUX_SESSION_NAME is already taken
            tmux attach-session -t "$QTMUX_SESSION_NAME"
        else
            tmux new-session -s "$QTMUX_SESSION_NAME"
        fi    
    }
fi
# }}}
# In Progress {{{
# WARNING!!! THE FOLLOWING IS ALL WIP AND PROBABLY WONT WORK
#OS Specific
# TODO [Enhancement] Has OS - Write Function to test what OS user is on
# TODO [Dependency] e<thing> (OS Specific) - This relies on hasOS function being written
# TODO [Testing] e<thing> (OS Specific) Need to test this on all OS's I run
#eupdate - easy update
#einstall - easy install
#eremove - easy remove
EOS_DECTIVE(){
    export EOS_DETECT
    EOS_DETECT=$(lsb_release -i | awk '{print "$3"}')
}

eupdate(){
    case $EOS_DETECT in
        Ubuntu)
            sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove
            ;;
        Fedora)
            sudo dnf upgrade && sudo dnf update
            ;;
        ARCH)
            sudo pacman -Syu
            ;;
        GENTOO)
            echo "STUFF"
            ;;
        *)
            echo "I cannot detect your OS, please use native tools"
            ;;
    esac
    if [[ "$2" == "pip" ]]; then
        if type pip > /dev/null; then
            pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install --upgrade
        else
            echo "You dont have pip installed"
        fi
    elif [[ "$2" == "gem" ]]; then
        if type gem > /dev/null; then
            echo "STUFF"
        else
            echo "You dont have gem installed"
        fi
    elif [[ "$2" == "js" ]]; then
        echo "STUFF"
    else
        echo "Sorry, im not sure how to manage that languages packages"
    fi
}

# TODO einsatll() only allows for a single package to be installed (with dependcies) need to upgrade to allow more then 1 package passed
einsatll(){
    case $EOS_DETECT in
        Ubuntu)
            sudo apt-get insatll "$2"
            ;;
        Fedora)
            sudo dnf insatll "$2"
            ;;
        ARCH)
            sudo pacman -S "$2"
            ;;
        GENTOO)
            echo "STUFF"
            ;;
        *)
            echo "I cannot detect your OS, please use native tools"
            ;;
    esac

    if [[ "$3" == "pip" ]]; then
        if type pip > /dev/null; then
            sudo pip install "$4"
        else
            echo "You dont have pip installed"
        fi
    elif [[ "$3" == "gem" ]]; then
        if type gem > /dev/null; then
            sudo gem install "$4"
        else
            echo "You dont have gem installed"
        fi
    elif [[ "$3" == "js" ]]; then
        echo "STUFF"
    else
        echo "Sorry, im not sure how to manage that languages packages"
    fi
}

# TODO eremove() only allows for a single package to be removed (with non-shared dependcies) need to upgrade to allow more then 1 package passed
eremove(){
    case $EOS_DETECT in
        Ubuntu)
            sudo apt-get remove "$2"
            ;;
        Fedora)
            sudo dnf remove "$2"
            ;;
        ARCH)
            sudo pacman -Rs "$2"
            ;;
        GENTOO)
            echo "STUFF"
            ;;
        *)
            echo "I cannot detect your OS, please use native tools"
            ;;
    esac

    if [[ "$3" == "pip" ]]; then
        if type pip > /dev/null; then
            echo "STUFF"
        else
            echo "You dont have pip installed"
        fi
    elif [[ "$3" == "gem" ]]; then
        if type gem > /dev/null; then
            echo "STUFF"
        else
            echo "You dont have gem installed"
        fi
    elif [[ "$3" == "js" ]]; then
        echo "STUFF"
    else
        echo "Sorry, im not sure how to manage that languages packages"
    fi
}
# }}}
# Vim: set foldmethod=marker foldlevel=0 :
