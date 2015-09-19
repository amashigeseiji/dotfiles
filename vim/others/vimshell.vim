let g:vimshell_vimshrc_path = expand('~/dotfiles/vim/vimshrc')
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vp :VimShellPop<CR>
augroup vimshell_loading
  autocmd!
  autocmd FileType vimshell setlocal nonumber
  autocmd FileType vimshell nnoremap <buffer> <CR> G$a
  autocmd FileType vimshell nnoremap <buffer> a G$a
  autocmd FileType vimshell nnoremap <buffer> o <nop>
  autocmd FileType vimshell nnoremap <buffer> <C-n> i<C-n>
  autocmd FileType vimshell nnoremap <buffer> <C-p> i<C-p>
  autocmd FileType vimshell call vimshell#hook#add('postexec', 'git-detect', 'MyVimshellGit')
augroup END
let g:vimshell_prompt = '>> '
let g:vimshell_right_prompt = '"[" . getcwd() . "]"'
let g:vimshell_cat_command = 'less'

function! MyVimshellGit(args, context)
  if exists('b:git_dir')
    unlet b:git_dir
  endif
  call fugitive#detect(vimshell#get_status_string())
endfunction
