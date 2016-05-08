function makeAlias(){
  local IFS_BACKUP apps appname
  IFS_BACKUP=$IFS
  IFS=$'\n'
  apps=(`find $1 -maxdepth 3 -name "*app" -exec basename {} .app ';'`)
  for i in ${apps[@]}
  do
    appname=${i// /}
    appname=${appname#Microsoft}
    appname=${appname#Adobe}
    [ 'boot2docker' = ${appname} ] && continue
    alias ${appname}="open -a \"$i\""
  done
  IFS=${IFS_BACKUP}
}
makeAlias '/Applications'
unfunction makeAlias
