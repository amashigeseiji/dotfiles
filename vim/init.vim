function! s:source_file(path)
  let l:path = expand('~/.vim/') . a:path
  if filereadable(l:path)
    exec 'source ' . l:path
  endif
endfunction
function! s:source_rc(name)
  let l:path = 'rc/' . a:name . '.rc.vim'
  call s:source_file(l:path)
endfunction

for name in g:vimrc_load_rcfile
  call s:source_rc(name)
endfor

let s:load_files = exists('g:vimrc_load_other_settings') ?
  \ g:vimrc_load_other_settings :
  \ systemlist('ls ' . g:other_settings_dir . ' | grep vim$ | sed -e "s/.vim$//g"')
for i in s:load_files
  call s:source_file('others/' . i . '.vim')
endfor
