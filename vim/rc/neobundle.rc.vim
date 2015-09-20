" Bundle
function! vimrc.initialize_with.neobundle_rc()
  set nocompatible
  filetype off

  if has('vim_starting')
    let l:neobundle_dir = g:vimrc.home . '/bundle/neobundle.vim'
    if finddir(l:neobundle_dir) == ''
      execute '!git clone https://github.com/Shougo/neobundle.vim.git ' . l:neobundle_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(l:neobundle_dir, ':p')
  endif

  call neobundle#begin(g:vimrc.home . '/bundle/')

  if neobundle#load_cache()
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#load_toml(g:vimrc.home . '/neobundle.toml')
    call neobundle#load_toml(g:vimrc.home . '/neobundlelazy.toml', {'lazy' :1} )
    NeoBundleSaveCache
  endif

  call neobundle#end()
  syntax on
  filetype plugin indent on
  NeoBundleCheck
endfunction
