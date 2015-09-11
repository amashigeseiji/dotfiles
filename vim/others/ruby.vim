aug RubyRead
  au!
  au FileType ruby nnoremap <buffer>,rc :Rcontroller<CR>
  au FileType ruby nnoremap <buffer>,rm :Rmodel<CR>
  au FileType ruby nnoremap <buffer>,rv :Rview<CR>
  au FileType ruby inoremap <buffer>{} {  }<Left><Left>
  au FileType ruby inoremap <buffer>// //<Left>
  au FileType ruby setl foldmethod=syntax
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
