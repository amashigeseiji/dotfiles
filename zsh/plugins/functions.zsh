r() { #reload {{{
  local f
  f=(~/.zsh/fpath/*(.) ~/.zsh/plugins/*(.))
  unfunction $f:t 2> /dev/null
  autoload -U $f:t
} #}}}
dict () { open dict://$1 }
