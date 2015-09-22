function! s:config_rc(dir, name)
  execute 'tabedit ' . g:vimrc.path(a:dir . '/' . a:name)
endfunction
function! s:config_plugin_completion(ArgLead, CmdLine, CursorPos)
  let l:cmd = split(a:CmdLine)
  let l:len_cmd = len(l:cmd)
  let l:dir = systemlist('ls -F ' . g:vimrc.home . '/ | grep "/" | sed -e "s/\/$//g"')
  if l:len_cmd <= 1 || match(l:dir, printf('^%s$', l:cmd[1])) == -1
    return join(l:dir, "\n")
  else
    return join(systemlist('ls ' . g:vimrc.path(l:cmd[1])), "\n")
  endif
endfunction
command! -nargs=* -complete=custom,s:config_plugin_completion Config call s:config_rc(<f-args>)
nnoremap ,c :Config<space>
