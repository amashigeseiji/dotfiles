# symfony basic command completion
_symfony () {

  _symfony_get_command_list () {
    local temp_file='./.symfony_comp'
    if [ ! -e ${temp_file} ];then
      ./symfony | sed "1,/Available tasks/d" | awk 'BEGIN { cat=null; } /^[A-Za-z]+$/ { cat = $1; } /^  :[a-z]+/ { print cat $1; }' > $temp_file
    fi
    cat $temp_file;
  }

  if [ -f symfony ]; then
    if (( CURRENT == 2 )); then compadd `_symfony_get_command_list` && unfunction _symfony_get_command_list;fi
  fi
}

compdef _symfony symfony
