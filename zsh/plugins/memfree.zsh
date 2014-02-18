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
  echo 'du'
  du -sx / >& /dev/null & sleep 15 && kill $!
  echo 'purge'
  sudo purge
}
