#!/bin/zsh
ff(){ #{{{
  local bmark=$HOME/.zsh/bmark
  local url str prefix arg
  prefix='http://'
  if [ $# -gt 0 ];then
    while getopts ':b:f:' opt
    do
      case $opt in
        b) arg=$OPTARG;;
        f) shift;;
        *) echo 'invalid.';return;;
      esac
    done

    if [ $arg ];then
      if [ "$(cat $bmark | grep -E ^$arg' ')" ];then arg=$(cat $bmark | grep -E ^$arg' ' | awk '{print $2}');
      else echo 'argument invalid.';return
      fi
    else
      arg=$1
    fi

    if [ -e $1 ];then url=$1;
    elif [ ! $(echo $arg | grep -E '([.]+(com|jp|local|org))+') ];then
      for i in $@;do str=${str}+$i;done
      str=`echo $str | sed 's/^\+//'`
      url=${prefix}"google.com/search?q=$str";
    elif [[ ! ${arg} =~ ^(http) ]];then
      url=${prefix}${arg};
    elif [ ${arg} ];then
      url=${arg}
    fi
  fi
  open -a firefox $url
} #}}}
_ff(){ #{{{
  local bmark=$HOME/.zsh/bmark
  _getValues(){ cat $bmark | grep -vE '^#' | awk '{printf $1;printf "%s ","\:"$2;}'; }
  _arguments : \
    '-b[open bookmark]:bmarks:(($(_getValues)))' \
    '-f[open files]:files:_files -w'
  unfunction _getValues && return 0
} #}}}
compdef _ff ff
bmark(){ #{{{
  local bmark=$HOME/.zsh/bmark
  if [ $# -lt 2 ];then echo 'argument required.';return;fi
  if [ "$(cat $bmark | grep -E ^$1' ')" ];then echo 'this tag already exists.';return;fi
  echo "$1 $2" >> $bmark
  echo 'added bookmark.'
} #}}}
_bmark(){ #{{{
  local bmark=$HOME/.zsh/bmark
  compadd -X'%Btags%b' -J'tags' $(cat $bmark | grep -vE '^#' | awk '{print $1}')
} #}}}
compdef _bmark bmark
