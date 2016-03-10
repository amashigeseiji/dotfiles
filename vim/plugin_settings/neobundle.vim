let s:bundles = '~/.vim/neobundle.toml'
let s:bundle_lazys = '~/.vim/neobundlelazy.toml'
function! s:bundle_add(repository, ...)
  let lazy = 0
  for var in a:000
    if var == 'lazy'
      let lazy = 1
    endif
  endfor
  execute "redir! >> " . fnamemodify(lazy ? s:bundle_lazys : s:bundles, ':p')
    silent! echon "\n[[plugins]]"
    silent! echon "\nrepository = \'" . a:repository . "\'"
  redir END
  call neobundle#commands#clear_cache()
  call g:vimrc.initialize_with.before.neobundle_rc()
endfunction
command! -nargs=* BundleAdd call s:bundle_add(<f-args>)