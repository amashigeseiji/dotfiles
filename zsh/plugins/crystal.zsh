function _crystal() {
if (( CURRENT == 2 ));then
  _values \
    "subcommand" \
    "init[generate new crystal project]" \
    "build[compile program file]" \
    "deps[install project dependencies]" \
    "docs[generate documentation]" \
    "eval[eval code from args or standard input]" \
    "run[compile and run program file]" \
    "spec[compile and run specs (in spec directory)]" \
    "tool[run a tool]" \
    "-h[show this help]" \
    "-v[show version]" \
    && return 0
fi
}
compdef _crystal crystal
