if [ -e /usr/share/terminfo/x/xterm-256color ]; then
 export TERM='xterm-256color'
else
 export TERM='xterm-color'
fi


export PATH="$PATH:$HOME/.rvm/bin:$HOME/.local/bin" # Add RVM to PATH for scripting
