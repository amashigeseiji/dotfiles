#!/bin/zsh

if [ -z ${CAKE_COMMAND_PATH} ];then
  CAKE_COMMAND_PATH='app/Console/cake'
fi

alias cake=${CAKE_COMMAND_PATH}

_cake() {
  if [ -e ${CAKE_COMMAND_PATH} ];then
    __get_values () { echo $(exec ${CAKE_COMMAND_PATH} completion commands) }
    __get_subcommand_values () { echo $(exec ${CAKE_COMMAND_PATH} completion subcommands ${1}) }

    _arguments : \
      "1:commands:(($(__get_values)))" \
      "2:subcommands:(($(__get_subcommand_values ${words[2]})))" \
      && return 0

    unfunction __get_values __get_subcommand_values
  fi
}

compdef _cake cake
