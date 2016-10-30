kapp(){
  local pid=`ps ax | grep -E "(\/Applications\/){1}"$1 | grep -v grep | awk '{print $1;}'`
  kill $pid
}

#compdef killApp

_kapp(){
  local IFS_BACKUP=$IFS
  IFS=$'\n'
  compadd $(ps ax |grep /Applications/|grep -oE '(\/Applications\/){1}[a-zA-Z0-9 ]+(\.app)'|sed -e "s/\/Applications\///g")
  IFS=${IFS_BACKUP}
}

compdef _kapp kapp
