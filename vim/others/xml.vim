" 閉じタグの補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  "autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
  " xmlファイル自動整形(要xmllint)
  au FileType xml :silent 1,$!xmllint --format --recover - 2>/dev/null
augroup END
" タグ対応箇所に%で飛ぶ
source $VIMRUNTIME/macros/matchit.vim
