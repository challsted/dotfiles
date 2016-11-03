# vim:ft=zsh ts=2 sw=2 sts=2
# This is based on a fork of the origional "Agnoster" Theme
# The specific fork I'm refering to is "agnoster-fcamblor"
# One goal of that fork was to convert agnoster to Solarized
# You will need Powerline Fonts installed for this theme to work properly
#
# The reason for this fork is 2 fold:
# 1) Move away from Solarized and into Molokai (Part of a Universal Theme)
# 2) Learn how ZSH Prompt Themes Work (For Fun)

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''
SHOW_STASH_SEGMENT=1

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)

    if [[ $SHOW_STASH_SEGMENT -eq 1 ]]; then
        stash_size=$(git stash list | wc -l | tr -d ' ')
        if [[ stash_size -ne 0 ]]; then
            prompt_segment white black
            echo -n "+${stash_size}"
        fi
    fi

  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -z $ref ]]; then
    detached_head=true;
    ref="$(git show-ref --head -s --abbrev |head -n1 2> /dev/null)";
    ref_symbol="➦"
  else
    detached_head=false;
    ref=${ref/refs\/heads\//}
    ref_symbol=""
  fi

    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
      ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
      displayed_ahead=" (+${ahead})"
      behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')
    else
      ahead=""
      displayed_ahead=""
      behind=""
    fi

    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi

    echo -n "${ref_symbol} ${ref}${displayed_ahead}"

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:git:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats '%u%c'
    vcs_info
    echo -n "${vcs_info_msg_0_}"

    # Displaying upstream dedicated segment
    if [[ -n $remote ]]; then
      if [ $behind -ne 0 ]; then
        prompt_segment magenta white
      else
        prompt_segment white black
      fi
      echo -n " $remote (-$behind)"
    fi
  fi
}


# Dir: current working directory
prompt_dir() {
  prompt_segment magenta white '%~'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

prompt_next_line() {
  prompt_segment default yellow "%c>"
  echo -n "%{%f%}"
}

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt)
$(prompt_next_line) '
