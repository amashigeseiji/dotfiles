if [ ! -e $HOME/.anyenv ];then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
for D in `ls $HOME/.anyenv/envs`
do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
done
