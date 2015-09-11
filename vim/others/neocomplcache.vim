if v:version > 700
  let g:neocomplcache_enable_at_startup = 1           " 起動時に有効化
  let g:NeoComplCache_SmartCase = 1                   " Use smartcase.
  let g:NeoComplCache_EnableCamelCaseCompletion = 1   " Use camel case completion.
  let g:NeoComplCache_EnableUnderbarCompletion = 1    " Use underbar completion.
  let g:NeoComplCache_MinSyntaxLength = 3             " Set minimum syntax keyword length.
  let g:NeoComplCache_ManualCompletionStartLength = 0 " Set manual completion length.
  let g:neocomplcache_temporary_dir = '/tmp/.neocon'  "RamDiskをキャッシュディレクトリに設定
  "補完するためのキーワードパターンを指定
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*' "日本語を補完候補として取得しないようにする
  let g:NeoComplCache_CachingPercentInStatusline = 1 " Print caching percent in statusline.

  "シンタックス補完を無効に
  let g:neocomplcache_plugin_disable = {
    \ 'syntax_complete' : 1,
    \ }

  "ファイルタイプの関連付け
  if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
  endif
  "let g:neocomplcache_same_filetype_lists['ctp'] = 'php'
  "let g:neocomplcache_same_filetype_lists['twig'] = 'html'

  "ディクショナリ補完
  "ファイルタイプごとの辞書ファイルの場所
  "let g:neocomplcache_dictionary_filetype_lists = {
  "  \ 'default' : '',
  "  \ 'php' : $HOME . '/.vim/dict/php_func.dict',
  "  \ 'vimshell' : $HOME . '/.vimshell/command-history',
  "  \ }
endif
