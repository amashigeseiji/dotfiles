#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -d ~/.zsh ];then
  ln -s $path/zsh ~/.zsh
  echo 'linked ~/.zsh'
fi
if [ ! -e ~/.zshrc ];then
  touch ~/.zshrc
  echo 'targetPlugins=("prompt")' >> ~/.zshrc
  echo 'prompt_color="yellow"'
  echo 'source ~/.zsh/zshrc-mac' >> ~/.zshrc
  echo 'created ~/.zshrc'
fi
echo 'finished zsh install'
