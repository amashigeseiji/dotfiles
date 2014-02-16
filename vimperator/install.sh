#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -d ~/.vimperator ];then
  mkdir ~/.vimperator
  echo 'mkdir ~/.vimperator'
fi
if [ ! -d ~/.vimperator/plugin ];then
  mkdir ~/.vimperator/plugin
  echo 'mkdir ~/.vimperator/plugin'
fi
if [ ! -d ~/.vimperator/vimperator-plugins ];then
  git clone git@github.com:vimpr/vimperator-plugins.git ~/.vimperator/
  echo 'clone vimperator-plugins'
fi
if [ ! -d ~/.vimperator/colors ];then
  ln -s $path/colors ~/.vimperator/
  echo 'linked ~/.vimperator/colors'
fi
if [ ! -d ~/.vimperator ];then
  ln -s $path/conf ~/.vimperator/
  echo 'linked ~/.vimperator/conf'
fi
if [ ! -e ~/.vimperatorrc ];then
  ln -s $path/vimperatorrc ~/.vimperatorrc
  echo 'linked ~/.vimperatorrc'
fi
echo 'finished vimperator install'
