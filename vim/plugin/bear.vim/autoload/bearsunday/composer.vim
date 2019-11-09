let s:composer = {}
let s:composerLoaded = 0
let s:composerDir = ''

" ファイルの探索処理 {{{
" see https://blog.engineer.adways.net/entry/2018/07/27/150000
function! s:FindFile(dir, pattern)
  let dir = (a:dir)[1:]
  let files = split(glob(dir . "/*"), "\n")
  for file in files
    let l:filename = fnamemodify(file, ":t")
    if l:filename == a:pattern
      return file
    endif
  endfor
endfunction
"}}}

" get composer {{{
function! s:GetComposer()
  if s:composerLoaded
    return s:composer
  endif

  echo ''
  let l:count         = 0
  let l:current_dir   = expand("%:p:h")
  let l:pwd           = getcwd()
  while l:count < len(split(l:current_dir, "\/"))
    let file = s:FindFile(execute("pwd"), "composer.json")
    if !empty(file)
      break
    else
      execute "lcd ../"
      let l:pwd = getcwd()
      let l:count += 1
    endif
  endwhile

  if empty(file)
    cd %:h
  endif
  let s:composerLoaded = 1
  let s:composerDir = l:pwd
  let s:composer = json_decode(join(readfile(l:file)))
  return s:composer
endfunction
" }}}

" Get namespace from composer.json {{{
function! bearsunday#composer#namespace()
  let l:composer = s:GetComposer()
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

" get composer directory
function! bearsunday#composer#dir()
  call s:GetComposer()
  return s:composerDir
endfunction
