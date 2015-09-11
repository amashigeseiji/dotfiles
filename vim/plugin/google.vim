function! GoogleSearch(...)
  let q = ''
  for i in a:000
    if l:q == ''
      let q = join([l:q, i], '')
    else
      let q = join([l:q, i], '+')
    endif
  endfor

  let url = 'http://google.co.jp/search?num=50&hl=ja&lr=lang_ja&q='.l:q
  exec 'W3mSplit '.url
endfunction
command! -nargs=+ Google :call GoogleSearch(<f-args>)
