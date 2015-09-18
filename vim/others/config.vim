let g:config_dir = '~/.vim/others/'
function! s:config_plugin(plugin)
  let l:file = expand(g:config_dir) . a:plugin
  execute 'edit ' . l:file
endfunction
function! s:config_plugin_completion(ArgLead, CmdLine, CursorPos)
  return systemlist('ls ' . expand(g:config_dir) . ' | grep vim$')
endfunction
command! -nargs=* -complete=customlist,s:config_plugin_completion Config call s:config_plugin(<q-args>)
nnoremap ,c :Config<space>
