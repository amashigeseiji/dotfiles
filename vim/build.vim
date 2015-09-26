let g:dotfile = expand('~/dotfiles/vim/')
function! s:dotfile_build()
  if !isdirectory(expand('~/.vim'))
    exec "system('/bin/ln -s '" . g:dotfile . "' ~/.vim')"
  endif
  let l:vimrc = expand('~/.vimrc')
  redir >> ~/.vimrc
    echon "\n"
    echon "\"written by build.vim\n"
    echon "source ~/.vim/init.vim\n"
    echon "let g:localvimrc = '~/.vimrc.local'\n"
    echon "let g:localgvimrc = '~/.gvimrc.local'"
    echon "call vimrc.init()"
  redir END
endfunction
call s:dotfile_build()
