#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ${#} -eq 0 ];then
  echo 'arguments:
    zsh
    vim
    screen
    tmux'
  exit
fi

for i in ${@}; do sh $path/$i/install.sh; done
