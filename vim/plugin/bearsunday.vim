scriptencoding utf-8
if exists('g:loaded_BEAR_plugin')
    finish
endif
let g:loaded_BEAR_plugin = 1

let s:save_cpo = &cpo
set cpo&vim

" see https://blog.engineer.adways.net/entry/2018/07/27/150000
let s:current_dir   = expand("%:p:h")
let s:file_patterns = ["composer.json"]

" ファイルを指定せずにvimを起動したら処理を抜ける
if @% == ""
  finish
endif

" 探索したいファイル名群とマッチするかどうか判定 {{{
function! s:IsMatchPattern(file)
  for pattern in s:file_patterns
    return a:file == pattern
  endfor
endfunction
"}}}

" ファイルの探索処理 {{{
function! s:FindFile(dir)
  let dir = (a:dir)[1:]
  let normalfiles = split(glob(dir . "/*"), "\n")
  let dotfiles    = split(glob(dir . "/\.*"), "\n") 
  for file in normalfiles + dotfiles
    let filename = fnamemodify(file, ":t")
    if s:IsMatchPattern(filename)
      return file
    endif
  endfor
endfunction
"}}}

let s:count = 0

" Get composer.json {{{
function! s:GetComposer()
  while s:count < len(split(s:current_dir, "\/"))
    let file = s:FindFile(execute("pwd"))
    if !empty(file)
      break
    else
      execute "lcd ../" 
      let s:count += 1
    endif
  endwhile

  if empty(file)
    cd %:h
  endif
  return file
endfunction

let s:composer = s:GetComposer()

" Get namespace from composer.json {{{
function! s:GetNamespace()
  let l:composer = json_decode(join(readfile(s:composer)))
  let l:items = []
  for i in values(l:composer['autoload'])
    call add(l:items, items(i))
  endfor
  let l:namespaces = l:items[0]
  let l:current = expand('%:h')
  let l:substitute = ''
  for j in l:namespaces
    let l:substitute = substitute(l:current, j[1], escape(j[0], '\\'), "")
  endfor
  return substitute(l:substitute, '/', '\\', '')
endfunction
" }}}

" new resource {{{
function! s:BearResourceApp()
  let l:input = [
        \'<?php',
        \'namespace ' . s:GetNamespace() . ';',
        \'',
        \'use BEAR\Resource\ResourceObject;',
        \'',
        \'class ' . expand("%:t:r") . ' extends ResourceObject',
        \'{',
        \'}'
        \]
  return setline('.', l:input)
endfunction
" }}}

" resource {{{
function! s:BearResource(args)
  return system('php bin/app.php ' . join(a:args, ' '))
endfunction

function! s:BearResourceCompletion(ArgLead, CmdLine, CursorPos)
  let l:cmd = split(a:CmdLine)
  let l:len_cmd = len(l:cmd)

  if l:len_cmd <= 1
    let l:filter_cmd = printf('v:val =~ "^%s"', a:ArgLead)
    return filter(['options', 'get', 'post', 'put', 'patch', 'delete', 'head'], l:filter_cmd)
  else
  endif
endfunction
" }}}

command! BEARResourceAppNew call s:BearResourceApp()
command! -nargs=+ -complete=customlist,s:BearResourceCompletion BEARResource call s:BearResource(<f-args>)

augroup new_file
  autocmd!
  autocmd BufNewFile */Resource/App/*.php call s:BearResourceApp()
  autocmd BufNewFile */Resource/Page/*.php call s:BearResourceApp()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
