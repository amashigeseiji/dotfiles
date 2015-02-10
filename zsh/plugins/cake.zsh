#!/bin/zsh

function cake () {
  if [ -e 'Vendor/bin/cake' ];then
    Vendor/bin/cake $@
  elif [ -e 'app/Console/cake' ];then
    app/Console/cake $@
  else
    return 1
  fi
}

_cake() {
    __get_values () { echo $(exec cake completion commands) }
    __get_subcommand_values () { echo $(exec cake completion subcommands ${1}) }

    _arguments : \
      "1:commands:(($(__get_values)))" \
      "2:subcommands:(($(__get_subcommand_values ${words[2]})))" \
      && return 0

    unfunction __get_values __get_subcommand_values
}

compdef _cake cake
