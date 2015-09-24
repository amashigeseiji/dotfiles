let vimrc = {
      \ 'home': expand('~/.vim'),
      \ 'dir': { 'others': 'others', 'rc': 'rc' },
      \ 'require': ['neobundle', 'basic', 'keymap'],
      \ 'initialize_with': {
      \   'before': {}, 'after': {}}
      \}

function! s:load(method)
  let self = {}

  function! self.source_file(path)
    let l:path = g:vimrc.home . '/' . a:path
    if filereadable(l:path)
      exec 'source ' . l:path
    endif
  endfunction

  function! self.require()
    for name in g:vimrc.require
      call self.source_file(g:vimrc.dir.rc . '/' . name . '.rc.vim')
    endfor
  endfunction

  function! self.other_settings()
    if exists('g:other_settings_dir')
      let g:vimrc.dir.others = g:other_settings_dir
    endif
    let l:load_files = exists('g:vimrc_load_other_settings') ?
      \ g:vimrc_load_other_settings :
      \ systemlist('ls ' . g:vimrc.path('others') . ' | grep vim$ | sed -e "s/.vim$//g"')
    for file in l:load_files
      call self.source_file(g:vimrc.dir.others . '/' . file . '.vim')
    endfor
  endfunction

  call self[a:method]()
endfunction

function! vimrc.init()
  call s:load('require')
  for key in keys(self.initialize_with.before)
    call self.initialize_with.before[key]()
  endfor
  for key in keys(self.initialize_with)
    if key != 'before' && key != 'after'
      call self.initialize_with[key]()
    endif
  endfor
  for key in keys(self.initialize_with.after)
    call self.initialize_with.after[key]()
  endfor
  call s:load('other_settings')
endfunction

function! vimrc.path(dir)
  let dir = a:dir
  if exists('self.dir.' . a:dir)
    let dir = self.dir[a:dir]
  endif
  return self.home . '/' . dir
endfunction

function! vimrc.initialize_with.localvimrc()
  if exists('g:localvimrc') && filereadable(expand(g:localvimrc))
    exec 'source ' . g:localvimrc
  endif
endfunction

exec 'set runtimepath+=~/.vim'
