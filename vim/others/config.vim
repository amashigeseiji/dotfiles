function! s:config_rc(dir, name)
  let l:file = g:vimrc.path(a:dir) . '/' . a:name
  execute 'tabedit ' . l:file
endfunction
function! s:config_plugin_completion(ArgLead, CmdLine, CursorPos)
  let l:cmd = split(a:CmdLine)
  let l:len_cmd = len(l:cmd)
  let l:dir = systemlist('ls -F ' . g:vimrc.home . '/ | grep "/" | sed -e "s/\/$//g"')
  if l:len_cmd <= 1
    let l:filter_cmd = printf('v:val =~ "^%s"', a:ArgLead)
    return filter(l:dir, l:filter_cmd)
  elseif filter(l:dir, printf('v:val =~ "^%s$"', l:cmd[1])) != []
    let l:syscmd = 'ls ' . g:vimrc.path(l:cmd[1])
    if a:ArgLead != ''
      let l:syscmd .= ' | grep ^' . a:ArgLead
    endif
    return systemlist(l:syscmd)
  endif
endfunction
command! -nargs=* -complete=customlist,s:config_plugin_completion Config call s:config_rc(<f-args>)
nnoremap ,c :Config<space>
