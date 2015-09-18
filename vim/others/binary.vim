augroup BinaryXXD
  au!
  au BufReadPre *.bin let &binary = 1
  au BufReadPost * if &binary | silent %!xxd -g 1
  au BufReadPost * setl ft=xxd | endif
  au BufWritePre * if &binary | %!xxd -r | endif
  au BufWritePost * if &binary | silent %!xxd -g 1
  au BufWritePost * setl nomod | endif
augroup END
