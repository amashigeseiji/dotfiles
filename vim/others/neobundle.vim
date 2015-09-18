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
  call neobundle#load_toml(s:bundles)
  call neobundle#load_toml(s:bundle_lazys, {'lazy' :1} )
  NeoBundleSaveCache
  call neobundle#load_cache()
  NeoBundleCheck
endfunction
command! -nargs=* BundleAdd call s:bundle_add(<f-args>)
