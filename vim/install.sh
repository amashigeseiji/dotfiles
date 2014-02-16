#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -e ~/.vimrc ];then
  ln -s $path/vimrc ~/.vimrc
fi
if [ ! -e ~/.gvimrc ];then
  ln -s $path/gvimrc ~/.gvimrc
fi
if [ ! -d ~/.vim ];then
  mkdir ~/.vim
  ln -s $path/colors ~/.vim/
  ln -s $path/plugin ~/.vim/
  git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
