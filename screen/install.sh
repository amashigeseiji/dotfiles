#!/bin/sh
path=`echo $(cd $(dirname $0);pwd)`
if [ ! -e ~/.screenrc ];then
  ln -s $path/screenrc ~/.screenrc
fi
