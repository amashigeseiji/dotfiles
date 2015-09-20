function! s:config_rc(dir, name)
  let l:file = $vimhome . '/' . a:dir . '/' . a:name
  execute 'tabedit ' . l:file
endfunction
function! s:config_plugin_completion(ArgLead, CmdLine, CursorPos)
  let l:cmd = split(a:CmdLine)
  let l:len_cmd = len(l:cmd)

  if l:len_cmd <= 1 || l:cmd[1] != 'rc' && l:cmd[1] != 'others'
    let l:filter_cmd = printf('v:val =~ "^%s"', a:ArgLead)
    return filter(['rc', 'others'], l:filter_cmd)
  else
    let l:syscmd = 'ls ' . $vimhome . '/' . l:cmd[1] . ' | grep .vim$'
    if a:ArgLead != ''
      let l:syscmd .= ' | grep ^' . a:ArgLead
    endif
    return systemlist(l:syscmd)
  endif
endfunction
command! -nargs=* -complete=customlist,s:config_plugin_completion Config call s:config_rc(<f-args>)
nnoremap ,c :Config<space>
