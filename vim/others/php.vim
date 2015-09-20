"php
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let g:php_folding = 1
let g:php_htmlInStrings = 1
"let php_sql_query = 1
"let php_noShortTags = 1  "autoindentされなくなるので却下
" PHP Lint
function! PHPLint()
  echo system( &ft . ' -l ' . bufname(""))
endfunction
" ファイルタイプの変更()
aug PHPRead
  autocmd!
  autocmd Filetype php nnoremap <buffer>,l :call PHPLint()<CR>
  autocmd Filetype php nnoremap <buffer> HH :set ft=html<CR>
  autocmd Filetype php nnoremap <buffer> PH :set ft=php<CR>
  autocmd Filetype php inoremap <buffer> $thi $this->
  autocmd Filetype php inoremap <buffer>?? ?php  ?<Left><Left>
aug END
