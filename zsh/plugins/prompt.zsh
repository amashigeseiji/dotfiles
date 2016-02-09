
if [ -z ${prompt_color} ];then
  prompt_color='yellow'
fi
if [ -z ${prompt_name} ];then
  prompt_name='%m'
fi
PROMPT="%B%F{red}@%f%F{${prompt_color}}${prompt_name}%f %F{blue}>>%f%b "
PROMPT2="%F{blue}%_> %f"
SPROMPT='correct: %F{red}'%R'%f to %F{blue}'%r'%f [y,n,a,e]? %f'
if [ ${prompt_git_use} ];then
  function rprompt-git-current-branch { #{{{
    # Show branch name in Zsh's right prompt(for git)
    local name st color gitdir action
    autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then return;fi

    name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
    if [[ -z $name ]]; then return;fi

    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

    if [[ -e "$gitdir/rprompt-nostatus" ]]; then
      echo "$name$action "
      return
    fi

    st=`git status 2> /dev/null`
    if [[ "$st" =~ "(?m)^nothing to" ]]; then
      color=%F{green}
    elif [[ "$st" =~ "(?m)^nothing added" ]]; then
      color=%F{yellow}
    elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
      color=%B%F{red}
    else
      color=%F{red}
    fi

    echo "$color$name$action%f%b "
  }
  #}}}
  RPROMPT='%B%F{blue}[%f%b`rprompt-git-current-branch`%B%F{blue}%~]%f%b'
else
  RPROMPT='%B%F{blue}[%f%F{blue}%~]%f%b'
fi
