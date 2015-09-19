"php
let php_folding = 1
let php_htmlInStrings = 1
"let php_sql_query = 1
"let php_noShortTags = 1  "autoindentされなくなるので却下
" PHP Lint
function! PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction
" ファイルタイプの変更()
aug PHPRead
  autocmd!
  autocmd Filetype php nnoremap <buffer>,l :call PHPLint()<CR>
  autocmd Filetype php nnoremap <buffer> HH :set ft=html<CR>
  autocmd Filetype php nnoremap <buffer> PH :set ft=php<CR>
  autocmd Filetype php inoremap <buffer> $thi $this->
  autocmd Filetype php inoremap <buffer>?? ?php  ?<Left><Left>
  autocmd BufRead,BufNewFile *.php.sample setl filetype=php
aug END
