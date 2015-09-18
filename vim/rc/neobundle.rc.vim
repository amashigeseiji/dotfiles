" Bundle
set nocompatible
filetype off

if has('vim_starting')
  let s:neobundle_dir = '~/.vim/bundle/neobundle.vim'
  if finddir(s:neobundle_dir) == ''
    execute '!git clone https://github.com/Shougo/neobundle.vim.git ' . s:neobundle_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:neobundle_dir, ':p')
endif

call neobundle#begin(expand('~/.vim/bundle/'))

if neobundle#load_cache()
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#load_toml('~/.vim/neobundle.toml')
  call neobundle#load_toml('~/.vim/neobundlelazy.toml', {'lazy' :1} )
  NeoBundleSaveCache
endif

call neobundle#end()
syntax on
filetype plugin indent on
NeoBundleCheck
