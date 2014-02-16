#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -e ~/.vimrc ];then
  ln -s $path/vimrc ~/.vimrc
  echo 'linked ~/vimrc'
fi
if [ ! -e ~/.gvimrc ];then
  ln -s $path/gvimrc ~/.gvimrc
  echo 'linked ~/gvimrc'
fi
if [ ! -d ~/.vim ];then
  mkdir ~/.vim
  echo 'mkdir ~/.vim'
fi
if [ ! -d ~/.vim/colors ];then
  ln -s $path/colors ~/.vim/
  echo 'linked ~/.vim/color'
fi
if [ ! -d ~/.vim/plugin ];then
  ln -s $path/plugin ~/.vim/
  echo 'linked ~/.vim/plugin'
fi
if [ ! -d ~/.vim/bundle/bundle ];then
  git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  echo 'clone bundle ~/.vim/bundle/vundle'
fi
echo 'finished vim install'
