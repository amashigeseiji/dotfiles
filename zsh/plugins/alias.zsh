function makeAlias(){
  local IFS_BACKUP apps appname
  IFS_BACKUP=$IFS
  IFS=$'\n'
  apps=(`find $1 -maxdepth 1 -name "*app"`)
  for i in ${apps[@]}
  do
    appname=$(echo $i | grep -oE '[a-zA-Z0-9 ]+(\.app)+$' | sed -e "s/.app//g" | sed -e "s/ //g" | sed -e "s/Microsoft//g" | sed -e "s/Adobe//g")
    if [ 'boot2docker' = ${appname} ];then
      continue;
    fi
    alias ${appname}="open -a \"$i\""
  done
  IFS=${IFS_BACKUP}
}
makeAlias '/Applications'
if [ -e '/Applications/Microsoft Office 2011/' ];then
  makeAlias '/Applications/Microsoft Office 2011/'
fi
unfunction makeAlias
