"php
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" PHP Lint
function! PHPLint()
  echo system( &ft . ' -l ' . bufname(""))
endfunction

"nnoremap <buffer>,l :call PHPLint()<CR>
nnoremap <buffer> HH :set ft=html<CR>
nnoremap <buffer> PH :set ft=php<CR>
"inoremap <buffer> $thi $this->
"inoremap <buffer>?? ?php  ?<Left><Left>
inoremap <buffer> <C-l> ->
"inoremap <buffer>?= <?=  ?><Left><Left><Left>

"setl textwidth=80 "自動折り返し
"setl formatoptions+=mM " テキスト挿入中の自動折り返しを日本語に対応させる

"let g:pdv_cfg_Type = 'string'
"let g:pdv_cfg_Comment1 = " * "
"let g:pdv_cfg_Commentn = " * "
"let g:pdv_cfg_Package = 'BENGO4.COM'
"let g:pdv_cfg_Version = '$id$'
"let g:pdv_cfg_Copyright = ''
"let g:pdv_cfg_Author = 'Seiji Amashige <amashige@bengo4.com>'
"let g:pdv_cfg_License = ""
"nnoremap <C-d> :call PhpDocSingle()<CR>
let g:pdv_template_dir = $HOME ."/.vim/pdv/templates"
nnoremap <buffer> <S-p> :call pdv#DocumentCurrentLine()<CR>

" folding with swekaj/php-foldexpr.vim
" @see https://github.com/swekaj/php-foldexpr.vim
let b:phpfold_use = 1
let b:phpfold_group_iftry = 1
let b:phpfold_docblocks = 0
let b:phpfold_doc_with_funcs = 0
let b:phpfold_group_case = 0

setl tabstop=4          " タブの画面上での幅
setl expandtab          " タブをスペースに展開しない
setl shiftwidth=4       " autoindentなどの時のタブ幅
setl softtabstop=4
setl smartindent
setl autoindent

"setl tags=.php.tags;

"function! s:_GetCwordStartPos()
"  let cword = expand('<cword>')
"  let cword_pattern = '\V' . escape(cword, '\')
"  let cword_end_pos = searchpos(cword_pattern, 'ceW', line('.'))
"  let cword_start_pos = searchpos(cword_pattern, 'bcW', line('.'))
"  return cword_start_pos
"endfunction
"
"function! s:GuessClassName()
"  let cursor_pos = getpos('.')
"  let class_name = s:_GuessClassName()
"  call setpos('.', cursor_pos)
"  return class_name
"endfunction
"
"function! s:_GuessClassName()
"  let line = getline('.')
"  let prefix_end_index = s:_GetCwordStartPos()[1] - 2
"  let prefix = prefix_end_index >= 0 ? line[:prefix_end_index] : ''
"
"  if prefix =~# '\<self::$' || prefix =~# '$this->$'
"    return s:_GetCurrentClassName()
"  elseif prefix =~# '\<\k\+::$'
"    return matchstr(prefix, '\<\zs\k\+\ze::$')
"  else
"    return ''
"  endif
"endfunction
"
"function! s:_GetCurrentClassName()
"  normal! 999[{
"  if search('\<class\>', 'bW') == 0
"    return ''
"  endif
"  normal! W
"  return expand('<cword>')
"endfunction
"
"function! s:ReorderTags(tags)
"  let cword = expand('<cword>')
"  let current_filename = expand('%:p')
"  let exact_tags_in_current_file = []
"  let other_tags = []
"  for tag in a:tags
"    if tag['name'] ==# cword && fnamemodify(tag['filename'], ':p') ==# current_filename
"      call add(exact_tags_in_current_file, tag)
"    else
"      call add(other_tags, tag)
"    endif
"  endfor
"  return exact_tags_in_current_file + other_tags
"endfunction
"
"function! s:PhpTagJump()
"  let class_name = s:GuessClassName()
"  let jump_count = ''
"  if class_name != ''
"    let tags = s:ReorderTags(taglist(expand('<cword>')))
"    for tag in tags
"      if has_key(tag, 'class') && tag['class'] ==# class_name
"        let jump_count = index(tags, tag) + 1
"        break
"      endif
"    endfor
"  endif
"  execute 'normal!' jump_count."\<C-]>"
"endfunction
"
"nnoremap <buffer> <silent> <C-g><C-j>  :<C-u>call <SID>PhpTagJump()<CR>


