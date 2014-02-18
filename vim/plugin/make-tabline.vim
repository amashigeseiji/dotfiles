if v:version > 702
" http://d.hatena.ne.jp/thinca/20111204/1322932585
function! MakeTabLine()
  let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
  let sep = '%#TabLineGap#' . ' '  " タブ間の区切り
  let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
  let info = '%#TabLineInfo#' . '[pwd:'. fnamemodify(getcwd(), ":~") . ']'

  return tabpages . '%=' . info  " タブリストを左に、情報を右に表示
endfunction

function! s:tabpage_label(tabpagenr)
  " t:title と言う変数があったらそれを使う
  let title = gettabvar(a:tabpagenr, 'title')
  if title !=# ''
    return title
  endif

  " タブページ内のバッファのリスト
  let bufnrs = tabpagebuflist(a:tabpagenr)

  " バッファが複数あったらバッファ数を表示
  let no = len(bufnrs)
  let no = no is 1 ? '' : '(' . no  . ')'
  " タブページ内に変更ありのバッファがあったら '+' を付ける
  let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '[+]' : ''
  let tabinfo = no . mod

  " カレントバッファ
  let curbufnr = bufnrs[tabpagewinnr(a:tabpagenr) - 1]  " tabpagewinnr() は 1 origin
  let fname = fnamemodify(bufname(curbufnr), ':t')
  " vimfilerの場合はカレントディレクトリ名を表示
  if bufname(curbufnr) =~ 'vimfiler'
    let fname = '%#TabLineVimFiler#' . vimfiler#get_status_string()
  endif
  let fname = fname is '' ? '[No Name]' : fname "バッファが空ならNo title
  let fname = ' '.fname.' '

  " カレントタブページかどうかでハイライトを切り替える
  let hifname = a:tabpagenr is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
  let hipageinfo = a:tabpagenr is tabpagenr() ? '%#TabLineSelPageInfo#' : '%#TabLinePageInfo#'

  let label = hifname . fname . hipageinfo . tabinfo

  return '%' . a:tabpagenr . 'T' . label . '%T%#TabLineFill#'
endfunction

set tabline=%!MakeTabLine()

" color {{{
" 選択されているタブ
hi TabLineSel           ctermfg=187 ctermbg=16 cterm=bold,underline
hi TabLineSelPageInfo   ctermfg=208 ctermbg=16
" その他のタブ
hi TabLine              term=reverse cterm=reverse ctermfg=238 ctermbg=236 gui=underline guifg=Black guibg=gray
hi TabLinePageInfo      term=reverse cterm=reverse ctermfg=238 ctermbg=236 gui=underline guifg=Black guibg=gray
" 空いているところ
hi TabLineFill          term=reverse cterm=reverse ctermfg=059 ctermbg=041 gui=reverse,bold guifg=LightGray guibg=black
" info
hi TabLineInfo          term=reverse ctermfg=green ctermbg=8 guifg=black guibg=lightblue
" 隙間
hi TabLineGap           ctermbg=248
hi TabLineVimFiler      ctermfg=red
"}}}
endif
