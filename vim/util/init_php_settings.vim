" phpmanual
function! s:get_phpmanual()
  let l:phpman_url = 'http://jp2.php.net/get/php_manual_ja.tar.gz/from/this/mirror'
  if !isdirectory(expand('~/.cache/man'))
    call mkdir(expand('~/.cache/man'))
  endif
  if !isdirectory(expand('~/.cache/man/php-chunked-xhtml'))
    let l:wget = 'wget '.l:phpman_url.' -O /tmp/php_manual.tar'
    let l:tar  = 'tar zxvf /tmp/php_manual.tar -C ~/.cache/man/'
    let l:rm   = 'rm /tmp/php_manual.tar'
    call system(join([l:wget, l:tar, l:rm], ' && '))
  endif
endfunction

" 補完用辞書
function! s:create_phpdict()
  if !isdirectory(expand('~/.vim/dict'))
    call mkdir(expand('~/.vim/dict'))
  endif
  call system('php ~/.vim/util/create_php_dict.php > ~/.vim/dict/php.dict')
endfunction

call s:get_phpmanual()
call s:create_phpdict()
