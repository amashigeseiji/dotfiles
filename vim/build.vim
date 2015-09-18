let s:dotfile = expand('~/dotfiles/vim/')
function! s:dotfile_build()
  if !isdirectory(expand('~/.vim'))
    system('ln -s ' . s:dotfile . ' ~/.vim')
  endif
  let l:vimrc = expand('~/.vimrc')
  redir >> ~/.vimrc
    echon "\n"
    echon "\"written by build.vim\n"
    echon "let g:vimrc_load_rcfile = ['neobundle', 'basic', 'keymap']\n"
    echon "let g:other_settings_dir = '~/.vim/others/'\n"
    echon "\" you can choose to be loaded setting file, name without '.vim'\n"
    echon "\"let g:vimrc_load_other_settings = ['somefile', '']\n"
    echon "source ~/.vim/init.vim\n"
    echon "if filereadable(expand('~/.vim/vimrc.local'))\n"
    echon "  source ~/.vim/vimrc.local\n"
    echon "end\n"
  redir END
endfunction
call s:dotfile_build()
