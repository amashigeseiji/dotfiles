if [ ! -e $HOME/.anyenv ];then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
