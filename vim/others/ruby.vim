aug RubyRead
  au!
  au FileType ruby nnoremap <buffer>,rc :Rcontroller<CR>
  au FileType ruby nnoremap <buffer>,rm :Rmodel<CR>
  au FileType ruby nnoremap <buffer>,rv :Rview<CR>
  au FileType ruby inoremap <buffer>{} {  }<Left><Left>
  au FileType ruby inoremap <buffer>// //<Left>
  au FileType ruby setl foldmethod=syntax
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ruby =
    \'[^. *\t]\.\w*\|\h\w*::'
aug END

aug ErbRead
  au!
  au BufReadPost,BufNewFile *.erb inoremap <buffer>%% <%  %><Left><Left><Left>
  au BufReadPost,BufNewFile *.erb inoremap <buffer>%= <%=  %><Left><Left><Left>
aug END

aug SlimRead
  au!
  au BufReadPost,BufNewFile *.slim setl filetype=slim
  au FileType slim setl foldmethod=indent
aug END
