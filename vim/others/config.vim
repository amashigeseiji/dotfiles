function! s:config_plugin(plugin)
  let l:file = expand(g:other_settings_dir) . a:plugin
  execute 'tabedit ' . l:file
endfunction
function! s:config_plugin_completion(ArgLead, CmdLine, CursorPos)
  let l:cmd = 'ls ' . expand(g:other_settings_dir) . ' | grep vim$'
  if a:ArgLead != ''
    let l:cmd .= ' | grep ^' . a:ArgLead
  endif
  return systemlist(l:cmd)
endfunction
command! -nargs=* -complete=customlist,s:config_plugin_completion Config call s:config_plugin(<q-args>)
nnoremap ,c :Config<space>
