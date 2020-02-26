"php
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

inoremap <buffer> <C-l> ->

"setl textwidth=80 "自動折り返し
"setl formatoptions+=mM " テキスト挿入中の自動折り返しを日本語に対応させる

setl tabstop=4          " タブの画面上での幅
setl expandtab          " タブをスペースに展開しない
setl shiftwidth=4       " autoindentなどの時のタブ幅
setl softtabstop=4
setl smartindent
setl autoindent

"setl tags=.php.tags;
