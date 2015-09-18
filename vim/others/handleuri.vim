" 行のURLを開く
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  if s:uri != ""
    echo s:uri
    exec "silent :w !open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>f :call HandleURI()<CR>
