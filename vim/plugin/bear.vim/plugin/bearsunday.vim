scriptencoding utf-8
if exists('g:loaded_BEAR_plugin')
    finish
endif
let g:loaded_BEAR_plugin = 1

let s:save_cpo = &cpo
set cpo&vim

" g:bearsundayDefaultUseTemplate
"
" usage:
" ```
" let g:bearsundayDefaultUseTemplate = [
"   \ 'BEAR\Resource\Annotation\JsonSchema',
"   \ 'Koriym\HttpConstants\StatusCode',
"   \]
" ```
let g:bearsundayDefaultUseTemplate = []
let g:bearsundayDefaultMethodTemplate = ['Get']

command! BEARNewResource call bearsunday#template#newResource()

augroup new_file
  autocmd!
  autocmd BufNewFile */Resource/App/*.php,*/Resource/Page/*.php call bearsunday#template#newResource()
augroup END

command! -nargs=+ -complete=customlist,bearsunday#resource#completion BEARResource call bearsunday#resource#call(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
