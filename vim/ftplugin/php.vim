"php
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" PHP Lint
function! PHPLint()
  echo system( &ft . ' -l ' . bufname(""))
endfunction

"nnoremap <buffer>,l :call PHPLint()<CR>
nnoremap <buffer> HH :set ft=html<CR>
nnoremap <buffer> PH :set ft=php<CR>
inoremap <buffer> $thi $this->
inoremap <buffer>?? ?php  ?<Left><Left>
inoremap <buffer> <C-l> ->
inoremap <buffer>?= <?=  ?><Left><Left><Left>

"setl textwidth=80 "自動折り返し
"setl formatoptions+=mM " テキスト挿入中の自動折り返しを日本語に対応させる

"let g:pdv_cfg_Type = 'string'
"let g:pdv_cfg_Comment1 = " * "
"let g:pdv_cfg_Commentn = " * "
"let g:pdv_cfg_Package = 'BENGO4.COM'
"let g:pdv_cfg_Version = '$id$'
"let g:pdv_cfg_Copyright = ''
"let g:pdv_cfg_Author = 'Seiji Amashige <amashige@bengo4.com>'
"let g:pdv_cfg_License = ""
"nnoremap <C-d> :call PhpDocSingle()<CR>
let g:pdv_template_dir = $HOME ."/.vim/pdv/templates"
nnoremap <buffer> <C-p> :call pdv#DocumentCurrentLine()<CR>

setl tabstop=4          " タブの画面上での幅
setl expandtab          " タブをスペースに展開しない
setl shiftwidth=4       " autoindentなどの時のタブ幅
setl softtabstop=4
setl smartindent
setl autoindent
