# symfony basic command completion
_symfony () {

  _symfony_get_command_list () {
    local temp_file='./.symfony_comp'
    if [ ! -e ${temp_file} ];then
      ./symfony | sed "1,/Available tasks/d" | awk 'BEGIN { cat=null; } /^[A-Za-z]+$/ { cat = $1; } /^  :[a-z]+/ { print cat $1; }' > $temp_file
    fi
    cat $temp_file | sed -e 's/^://g' ;
  }

  _getSymfonyCommandOptions () {
    php symfony help $1 | egrep '^\ *--*' | awk '{print $1}';
    #local IFS_BACKUP=$IFS; local IFS=$'\n'
    #local -a commandOptions options descriptions;
    #local cmd option description optspec;

    #commandOptions="$(php symfony help $1 | egrep '^\ *--*')";
    #options=($(printf '%s\n' $commandOptions | awk '{print $1}'));
    #descriptions=($(printf '%s\n' $commandOptions | sed -e 's/^ *--[a-z\-]* *//g'));
    #for i in $(seq 1 ${#options[@]})
    #do
    #  eval 'option=${options['$i']}'
    #  eval 'description=${descriptions['$i']}'
    #  optdesc=($optdesc[@] $"${option}"\t$"${description}");
    #  #optspec="${option}[${description}]"
    #  ##printf '%s\n' "${option}=-[\"${description}\"]::"
    #  #printf '%s\n' ${optspec}
    #done
    #printf '%s\n' $optdesc;
    #IFS=$IFS_BACKUP
  }

  if [ -f symfony ]; then
    if (( CURRENT == 2 )); then compadd $(_symfony_get_command_list) && unfunction _symfony_get_command_list;fi
    if (( CURRENT > 2 )); then
      if [ $words[2] -a $words[2] = "help" ];then
        compadd $(_symfony_get_command_list) && unfunction _symfony_get_command_list;
      elif [ $words[2] -a $words[2] = "app:routes" ];then
        compadd $(ls apps)
      else
        compadd $(_getSymfonyCommandOptions $words[2])
        #local IFS_BACKUP=$IFS; local IFS=$'\n';
        #compadd -J 'option' -X '%Uoptions%u' -ld $(_getSymfonyCommandOptions $words[2]) -- -x
        #IFS=$IFS_BACKUP && unfunction _getSymfonyCommandOptions && return 0
        ##_arguments : \
        ##  $(_getSymfonyCommandOptions $words[2]) \
        ##  && IFS=$IFS_BACKUP && unfunction _getSymfonyCommandOptions && return 0
      fi
    fi
  fi
}

compdef _symfony symfony
