_rake() {
  local cache='./.rake_tasks'
  local generate_cache='rake --silent --tasks 2> /dev/null | cut  -f 2 -d " " > ${cache}'
  __updated_at(){ echo $(stat -f "%m" $1) }

  if [ -f './Rakefile' ]; then
    if [ ! -f ${cache} ] || \
       [ "$( cat ${cache} | wc -l )" = "0" ] || \
       [ $( __updated_at ${cache} ) -lt $( __updated_at './Rakefile' ) ] || \
       [ -f './Gemfile' -a $( __updated_at ${cache} ) -lt $( __updated_at './Gemfile' ) ]; then
      eval ${generate_cache}
    fi
    compadd $( cat ${cache} )
  fi
}

compdef _rake rake
