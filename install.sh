#!/bin/bash
path=`echo $(cd $(dirname $0);pwd)`
args=($(printf '%s\n' $@ | egrep -v '^-.*'))
dirs=($(find $path -name '.install' | awk -F/ '{print $(NF-1)}'))

if [ $# -eq 0 ];then
  printf '%s\n' 'arguments:'
  printf '  %s\n' ${dirs[@]}
  exit
fi

linkto() {
  local path=$1
  local filename=$2
  local prefix=''
  if [ $3 ];then
    prefix=$3;
  fi
  if [ -L ~/${prefix}${filename} ];then
    ln -snf $path/${filename} ~/${prefix}${filename}
    echo 'linked ~/'${prefix}${filename}
  else
    if [ -e ~/${prefix}${filename} ];then
      mv ~/${prefix}${filename} ~/${prefix}${filename}.bak
      echo 'moved ~/'${prefix}${filename}.bak
    fi
    ln -s $path/${filename} ~/${prefix}${filename}
    echo 'linked ~/'${prefix}${filename}
  fi
}

vim_install() {
  linkto $1 'vimrc' '.'
  linkto $1 'gvimrc' '.'
  if [ ! -d ~/.vim ];then
    mkdir ~/.vim
    echo 'mkdir ~/.vim'
  fi
  linkto $1 'colors' '.vim/'
  linkto $1 'plugin' '.vim/'
  linkto $1 'syntax' '.vim/'
  linkto $1 'others' '.vim/'
  if [ ! -d ~/.vim/bundle/Vundle.vim ];then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo 'clone bundle ~/.vim/bundle/Vundle.vim'
  fi
  echo 'finished vim install'
}

zsh_install() {
  if [ -L ~/.zsh ];then
    ln -snf $1 ~/.zsh
    echo 'linked ~/.zsh'
  else
    if [ -e ~/.zsh ];then
      mv ~/.zsh ~/.zsh.bak
      echo 'moved ~/.zsh.bak'
    fi
    ln -s $1 ~/.zsh
    echo 'linked ~/.zsh'
  fi
  if [ ! -e ~/.zshrc ];then
    touch ~/.zshrc
    echo 'targetPlugins=("prompt")' >> ~/.zshrc
    echo 'prompt_color="yellow"' >> ~/.zshrc
    echo 'prompt_name="%m"' >> ~/.zshrc
    echo 'prompt_git_use=1' >> ~/.zshrc
    echo 'source ~/.zsh/zshrc-mac' >> ~/.zshrc
    echo 'created ~/.zshrc'
  fi
  echo 'finished zsh install'
}

tmux_install() {
  linkto $1 'tmux.conf' '.'
  if [ ! -d ~/.tmux ];then
    mkdir ~/.tmux
    echo 'mkdir ~/.tmux'
  fi
  linkto $1 'bin' '.tmux/'
  echo 'finished tmux install'
}

screen_install() {
  linkto $1 'screenrc' '.'
  echo 'finished screen install'
}

vimperator_install() {
  linkto $1 'vimperatorrc' '.'
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
  linkto $1 'colors' '.vimperator/'
  linkto $1 'conf' '.vimperator/'
  echo 'finished vimperator install'
}

for i in ${args[@]};
do
  if [ ! -d $path/$i ];then
    echo $i' is not exist.';
  elif [ ! -e $path/$i/.install ];then
    echo $i' has no .install';
  else
    eval $i'_install '$path'/'$i
  fi
done
