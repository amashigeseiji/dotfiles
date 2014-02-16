#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -e ~/.screenrc ];then
  ln -s $path/screenrc ~/.screenrc
  echo 'linked ~/.screenrc'
fi
echo 'finished screen install'
