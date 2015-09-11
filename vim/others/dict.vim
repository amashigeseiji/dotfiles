" ローカル辞書をひく(for mac)
if OSTYPE == "Darwin\n"
  function! DictSearch(...)
    let text = join(a:000, ' ')
    exec 'silent :w !open dict://"'.text.'"'
  endfunction
  command! -nargs=+ Dict :call DictSearch("<args>")
  nnoremap ,d :Dict<space>
endif
