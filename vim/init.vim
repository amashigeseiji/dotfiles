let vimrc = {
      \ 'home': expand('~/.vim'),
      \}

function! vimrc.init()
  " dein 初期化
  exec 'source ' . g:vimrc.home . '/rc/dein.rc.vim'
  exec 'source ' . g:vimrc.home . '/rc/basic.rc.vim'
  exec 'source ' . g:vimrc.home . '/rc/keymap.rc.vim'

  if exists('g:localvimrc') && filereadable(expand(g:localvimrc))
    exec 'source ' . g:localvimrc
  endif
endfunction
