if executable('w3m')
  autocmd! FileType w3m setl nonumber
  autocmd! FileType w3m nnoremap <buffer> q :bdelete!<CR>
endif
