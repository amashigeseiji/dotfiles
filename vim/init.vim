if !exists($vimhome)
  let $vimhome = expand('~/.vim')
endif

function! s:source_file(path) dict
  let l:path = $vimhome . '/' . a:path
  if filereadable(l:path)
    exec 'source ' . l:path
  endif
endfunction

function! s:source_rc() dict
  for name in self.rc_file
    call self.source_file('rc/' . name . '.rc.vim')
  endfor
endfunction

function! s:source_other_settings() dict
  let l:load_files = exists('g:vimrc_load_other_settings') ?
    \ g:vimrc_load_other_settings :
    \ systemlist('ls ' . g:other_settings_dir . ' | grep vim$ | sed -e "s/.vim$//g"')
  for i in l:load_files
    call self.source_file('others/' . i . '.vim')
  endfor
endfunction

function! s:init() dict
  call self.source_rc()
  call self.neobundle_init()
  call self.source_other_settings()
endfunction

let vimrc = {
      \ 'home': expand('~/.vim'),
      \ 'rc_file': ['neobundle', 'basic', 'keymap'],
      \ 'source_file': function('s:source_file'),
      \ 'source_rc': function('s:source_rc'),
      \ 'source_other_settings': function('s:source_other_settings'),
      \ 'init': function('s:init')
      \}

if exists('g:vimrc_load_rcfile')
  let vimrc.rc_file += g:vimrc_load_rcfile
endif

call vimrc.init()
