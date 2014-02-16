#google-seach{{{
function google() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'`
    opt='search?num=50&hl=ja&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m http://www.google.co.jp/$opt
}
#}}}
# eijiro{{{
function alc() {
  w3m 'http://eow.alc.co.jp/'"`echo $@`"'/UTF-8/' | awk 'NR>=37 {print}'|grep -v "英辞郎"|grep -v "データの転載"|grep -v "データ提供" |/usr/bin/less -p "`echo $@`"
}
_alc(){};compdef _alc alc
#}}}
# sudo.vim{{{
# vim sudo:{arg}をsudo vim {arg}に置き換え
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        if [ $arg[1] = '-' ]; then
          args[$(( 1+$#args ))]=$arg
        else
          args[$(( 1+$#args ))]="sudo:$arg"
        fi
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}
#}}}
r() { #reload {{{
  local f
  f=(~/.zsh/fpath/*(.) ~/.zsh/plugins/*(.))
  unfunction $f:t 2> /dev/null
  autoload -U $f:t
} #}}}
function memfree() {
  local IconService=`ps aux | grep com.apple.IconServicesAgent | grep -v grep | awk '{print $2}'`
  if [ -n $IconService ];then
    echo 'kill IconServiceAgent'
    kill -9 ${IconService}
  fi
  echo 'kill Finder'
  killall Finder
  echo 'kill Dock'
  killall Dock
  echo 'purge'
  sudo purge
}
dict () { open dict://$1 }
