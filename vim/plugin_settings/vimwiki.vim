let g:vimwiki_folding="syntax"
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_list=[{'path':'~/.vim/vimwiki/'}]
augroup VimWiki
  au!
  au FileType vimwiki nmap <buffer> <C-h> <Plug>VimwikiGoBackLink
  au FileType vimwiki nmap <buffer> <CR> <Plug>VimwikiFollowLink
augroup END
