#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -e ~/.tmux.conf ];then
  ln -s $path/tmux.conf ~/.tmux.conf
  echo 'linked ~/.tmux.conf'
fi
if [ ! -e ~/bin/loadaverage ];then
  ln -s $path/loadaverage ~/bin/
fi
if [ ! -e ~/bin/used-mem ];then
  ln -s $path/used-mem ~/bin/
fi
echo 'finished tmux install'
