nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vp :VimShellPop<CR>
autocmd FileType vimshell setlocal nonumber
let g:vimshell_prompt = '> '
let g:vimshell_right_prompt = '"[" . getcwd() . "]"'
