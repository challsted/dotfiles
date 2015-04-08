####################
# User configuration
####################

# Alt-S inserts "sudo " at the start of the line
insert_sudo () {
	zle beginnng-of-line ; zle -U "sudo " }
	zle -N insert-sudo insert_sudo
	bindkey "^[s" insert-sudo

#Explode the following formats by typing ex $1
ex () {
 if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2) tar xvjf $1 ;;
    *.tar.gz) tar xvzf $1 ;;
    *.tar.xz) tar xvJf $1 ;;
    *.tar.lzma) tar --lzma xvf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xvf $1 ;;
    *.tbz2) tar xvjf $1 ;;
    *.tgz) tar xvzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
  esac
 else
  echo "'$1' if not a valid file"
 fi
}

#Attempt at the ability to make a directory and imediatly cd into it!
function mkdircd () {
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
