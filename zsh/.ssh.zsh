####################
# User configuration
####################

# SSH Stuff {{
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
