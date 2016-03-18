function! vimrc.initialize_with.before.first()

  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  if has('vim_starting')
    if finddir(s:dein_repo_dir) == ''
      execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  endif

  call dein#begin(s:dein_dir)

  let l:toml      = g:vimrc.home . '/dein.toml'
  let l:toml_lazy = g:vimrc.home . '/deinlazy.toml'

  if dein#load_cache([$MYVIMRC, l:toml, l:toml_lazy])
    call dein#load_toml(l:toml,      {'lazy' : 0})
    call dein#load_toml(l:toml_lazy, {'lazy' : 1})
    call dein#save_cache()
  endif

  call dein#end()

  syntax on
  filetype plugin indent on

  if dein#check_install()
    call dein#install()
  endif

endfunction
