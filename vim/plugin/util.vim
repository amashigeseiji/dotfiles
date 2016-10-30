function! s:source(name)
  let l:file = g:vimrc.home . '/util/' . a:name . '.vim'
  if filereadable(l:file)
    exec "source " . l:file
  endif
endfunction

function! s:completion(ArgLead, CmdLine, CursorPos)
  return system('ls ' . g:vimrc.home . '/util | grep ".vim$" | sed -e "s/.vim//g"' )
endfunction

command! -nargs=+ -complete=custom,s:completion Util call s:source(<f-args>)
nnoremap ,u :Util<space>
