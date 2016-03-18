"php
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" PHP Lint
function! PHPLint()
  echo system( &ft . ' -l ' . bufname(""))
endfunction

nnoremap <buffer>,l :call PHPLint()<CR>
nnoremap <buffer> HH :set ft=html<CR>
nnoremap <buffer> PH :set ft=php<CR>
inoremap <buffer> $thi $this->
inoremap <buffer>?? ?php  ?<Left><Left>
inoremap <buffer> <C-l> ->
inoremap <buffer>?= <?=  ?><Left><Left><Left>

setl textwidth=80 "自動折り返し
setl formatoptions+=mM " テキスト挿入中の自動折り返しを日本語に対応させる
