#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -d ~/.vimperator ];then
  mkdir ~/.vimperator
  mkdir ~/.vimperator/plugin
  git clone git@github.com:vimpr/vimperator-plugins.git ~/.vimperator/
  ln -s $path/colors ~/.vimperator/
  ln -s $path/conf ~/.vimperator/
fi
if [ ! -e ~/.vimperatorrc ];then
  ln -s $path/vimperatorrc ~/.vimperatorrc
fi
