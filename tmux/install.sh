#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -e ~/.tmux.conf ];then
  ln -s $path/tmux.conf ~/.tmux.conf
  echo 'linked ~/.tmux.conf'
fi
if [ ! -d ~/.tmux ];then
  mkdir ~/.tmux
  echo 'mkdir ~/.tmux'
fi
if [ ! -d ~/.tmux/bin ];then
  ln -s $path/bin ~/.tmux/
  echo 'linked ~/.tmux/bin'
fi
echo 'finished tmux install'
