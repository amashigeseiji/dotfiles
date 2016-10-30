# alc
function alc() {
  w3m 'http://eow.alc.co.jp/'"`echo $@`"'/UTF-8/' | awk 'NR>=37 {print}'|grep -v "英辞郎"|grep -v "データの転載"|grep -v "データ提供" |/usr/bin/less -p "`echo $@`"
}
_alc(){};compdef _alc alc
