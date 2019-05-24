nnoremap <silent>F :VimFilerExplorer -buffer-name=explorer -project -simple -split  -winwidth=25 -toggle -no-quit -auto-cd<CR>
augroup MyVimFiler
  au!
  autocmd FileType vimfiler nmap <buffer> s <Plug>(vimfiler_toggle_mark_current_line)
  autocmd FileType vimfiler setlocal nonumber
augroup END
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_min_filename_width = 10
"let g:vimfiler_edit_action = 'tabopen'
"キャッシュはramに保存
let g:vimfiler_data_directory = '/tmp/.vimfiler'
"autocmd FileType vimfiler :map O <Plug>(vimfiler_double_click) 
