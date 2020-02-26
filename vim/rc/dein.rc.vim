let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if has('vim_starting')
  if finddir(s:dein_repo_dir) == ''
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  let s:toml      = g:vimrc.home . '/dein.toml'
  let s:toml_lazy = g:vimrc.home . '/deinlazy.toml'

  call dein#begin(s:dein_dir, [expand('<sfile>'), s:toml, s:toml_lazy])
  call dein#load_toml(s:toml,      {'lazy' : 0})
  call dein#load_toml(s:toml_lazy, {'lazy' : 1})
  call dein#end()
  call dein#save_state()

  if has('vim_starting') && dein#check_install()
    call dein#install()
  endif
endif
