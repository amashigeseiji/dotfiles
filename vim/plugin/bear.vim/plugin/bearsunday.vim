scriptencoding utf-8
if exists('g:loaded_BEAR_plugin')
    finish
endif
let g:loaded_BEAR_plugin = 1

let s:save_cpo = &cpo
set cpo&vim

let s:scriptDir = expand('<sfile>:p:h')

augroup new_file
  autocmd!
  autocmd BufNewFile */Resource/App/*.php,*/Resource/Page/*.php call bearsunday#template#newFile(s:scriptDir . '/../snip-resource')
  autocmd BufNewFile */Module/*.php call bearsunday#template#newFile(s:scriptDir . '/../snip-module')
augroup END

command! -nargs=+ -complete=customlist,bearsunday#resource#completion BEARResource call bearsunday#resource#call(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
