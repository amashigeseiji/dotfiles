if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

nnoremap <buffer>,rc :Rcontroller<CR>
nnoremap <buffer>,rm :Rmodel<CR>
nnoremap <buffer>,rv :Rview<CR>
setl foldmethod=syntax
setl omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby =
  \'[^. *\t]\.\w*\|\h\w*::'
