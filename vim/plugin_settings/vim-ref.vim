" php補完ファイル置き場
let g:ref_phpmanual_path = $HOME.'/.cache/man/php-chunked-xhtml'
" webdictサイトの設定
let g:ref_source_webdict_sites = {
\   'wiki': { 'url': 'http://ja.wikipedia.org/wiki/%s' },
\   'alc': { 'url': 'http://eow.alc.co.jp/%s' },
\   'oxford': { 'url': 'http://www.oxforddictionaries.com/definition/english/%s' },
\ }
" 一度開いたページをキャッシュ
let g:ref_source_webdict_use_cache = 1
let g:ref_cache_dir = '/tmp/vimref'
let g:ref_use_vimproc = 1
" デフォルトサイト
let g:ref_source_webdict_sites.default = 'alc'

augroup vimref_loading
  au!
  au FileType ref-phpmanual nnoremap <buffer><silent> q :bd<CR>
  au FileType ref-webdict nnoremap <buffer><silent> q :bd<CR>
augroup END

"let g:ref_phpmanual_cmd = 'w3m -dump %s'
nnoremap ,p :Ref<space>phpmanual<space>
nnoremap ,e :Ref webdict alc<space>
nnoremap ,o :Ref webdict oxford<space>

" 出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.alc.filter(output)
  let output=a:output
  "よみがなを削除
  let output=substitute(output, '｛\([^｝]\)*｝', '', 'g')
  let output=substitute(output, '◆', ' * ', 'g')
  let output=substitute(output, '⇒', '=>', 'g')
  ""》】）。"以外のマルチバイト文字で終わって"《【（・•"以外のマルチバイト文字で始まる文の改行コードを削除
  let output=substitute(output, '\([^\x01-\x7E^》^】^）^。]\)\n\s\+\([^\x01-\x7E^《^【^（^・^•]\)', '\1\2', 'g')
  let output=substitute(output, '（','(','g')
  let output=substitute(output, '）',')','g')
  " リストになっているタイトル文字列を==で囲む
  let output=substitute(output, '•\(\s[a-zA-Z]\+[a-zA-Z -,.]*\)', '\n==\1 ==', 'g')
  let output=substitute(output, '・\([a-zA-Z ]\+\)\n\s*\([a-zA-Z ]\+\.\)', '\1 \2', 'g')
  let output=substitute(output, '\(\.\)\(\s:\)', '\1\n        \2', 'g')

  return join(split(output, "\n")[30:], "\n")
endfunction

function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[8 :], "\n")
endfunction

function! g:ref_source_webdict_sites.oxford.filter(output)
  return join(split(a:output, "\n")[208 :], "\n")
endfunction
