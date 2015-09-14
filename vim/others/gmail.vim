let s:gmail_account_dir = '~/.gmail.vim'
if !isdirectory(expand('~/.gmail.vim'))
  call mkdir($HOME . '/.gmail.vim', 'p')
endif
if filereadable(expand('~/.gmail.vim/default'))
  source ~/.gmail.vim/default
endif
