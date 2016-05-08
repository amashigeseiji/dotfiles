if [ ! -e $HOME/.anyenv ];then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

export PATH="$HOME/.anyenv/bin:$PATH"
export ANYENV_anyenv=

for i in $(ls $HOME/.anyenv/envs/)
do
  export ANYENV_${i%/}=
done

source $HOME/.anyenv/completions/anyenv.${SHELL##*/}

function anyenv_init() {
  local env='anyenv'
  local export_var_prefix=ANYENV_
  [ $# -eq 1 ] && {
    [[ $1 =~ .*env ]] && env=$1 || return 1
  }

  local export_var=${export_var_prefix}${env}
  [ ! "$(eval printf '${'$export_var':-UNDEF}')" = 'UNDEF' ] && return

  [ $env = 'anyenv' ] && {
    eval "$(anyenv init - ${SHELL})"
    export ${export_var}=1
    for dir in `ls $HOME/.anyenv/envs`
    do
      dir=${dir%/}
      export PATH="$HOME/.anyenv/envs/$dir/shims:$PATH"
      export_var=${export_var_prefix}${dir}
      export $export_var=1
      [ -e $HOME/.anyenv/envs/$dir/completions/$dir.${SHELL##*/} ] && source $HOME/.anyenv/envs/$dir/completions/$dir.${SHELL##*/}
    done
  } || {
    export ${env:u}_ROOT="$HOME/.anyenv/envs/$env"
    export PATH="$HOME/.anyenv/envs/$env/bin:$HOME/.anyenv/envs/$env/shims:$PATH"
    eval "$($env init - ${SHELL})"
    export ${export_var}=1
    [ -e $HOME/.anyenv/envs/$env/completions/$env.${SHELL##*/} ] && source $HOME/.anyenv/envs/$env/completions/$env.${SHELL##*/}
  }
}
