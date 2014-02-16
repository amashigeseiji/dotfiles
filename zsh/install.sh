#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -d ~/.zsh ];then
  ln -s $path/zsh ~/.zsh
fi
if [ ! -e ~/.zshrc ];then
  touch ~/.zshrc
  echo 'source ~/.zsh/zshrc-mac' >> ~/.zshrc
fi
