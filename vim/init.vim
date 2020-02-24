let vimrc = {
      \ 'home': expand('~/.vim'),
      \ 'dir': {
      \   'plugin_settings': 'plugin_settings',
      \   'rc': 'rc'
      \ },
      \ 'require': ['basic', 'keymap'],
      \ 'initialize_with': {
      \   'before': {},
      \   'after': {}
      \  }
      \}

function! vimrc.path(dir)
  let dir = a:dir
  if exists('self.dir.' . a:dir)
    let dir = self.dir[a:dir]
  endif
  return self.home . '/' . dir
endfunction

function! s:load(method)
  let self = {}

  function! self.source_file(path)
    let l:path = g:vimrc.home . '/' . a:path
    if filereadable(l:path)
      exec 'source ' . l:path
    endif
    unlet l:path
  endfunction

  function! self.require()
    call self.source_file(g:vimrc.dir.rc . '/dein.rc.vim')
    for name in g:vimrc.require
      call self.source_file(g:vimrc.dir.rc . '/' . name . '.rc.vim')
    endfor
  endfunction

  function! self.plugin_settings()
    if exists('g:plugin_settings_dir')
      let g:vimrc.dir.plugin_settings = g:plugin_settings_dir
    endif

    let l:load_files = split(system('ls ' . g:vimrc.path('plugin_settings') . ' | grep vim$ | sed -e "s/.vim$//g"'), "\n")

    for file in l:load_files
      if (dein#tap(file) || dein#tap(file . '.vim'))
        call self.source_file(g:vimrc.dir.plugin_settings . '/' . file . '.vim')
      endif
    endfor

    unlet l:load_files
  endfunction

  call self[a:method]()
endfunction

function! vimrc.init()
  call s:load('require')

  if exists('self.initialize_with.before.first')
    call self.initialize_with.before.first()
  endif

  for key in keys(self.initialize_with.before)
    if (key != 'first')
      call self.initialize_with.before[key]()
    endif
  endfor

  for key in keys(self.initialize_with)
    if key != 'before' && key != 'after'
      call self.initialize_with[key]()
    endif
  endfor

  call s:load('plugin_settings')

  for key in keys(self.initialize_with.after)
    call self.initialize_with.after[key]()
  endfor

  if exists('g:localvimrc') && filereadable(expand(g:localvimrc))
    exec 'source ' . g:localvimrc
  endif
endfunction
