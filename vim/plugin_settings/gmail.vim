let g:gmail_nomove_after_select = 1
let g:gmail_account_dir = '~/.gmail.vim/account/'
let g:gmail_cache_dir = '~/.gmail.vim/cache/'

augroup gmail
  au!
  au Filetype gmail cnoremap <buffer> q GmailExit
augroup END

function! s:gmail(...)
  let s:gmail_default_account = g:gmail_account_dir . 'default'

  if !isdirectory(expand(g:gmail_account_dir))
    call mkdir(expand(g:gmail_account_dir), 'p', 0700)
  endif

  let account_setting = len(a:000) == 0 ? s:gmail_default_account : g:gmail_account_dir . a:000[0]

  if filereadable(expand(account_setting))
    let lines = readfile(expand(account_setting))
    let g:gmail_user_name = lines[0]
    let g:gmail_user_pass = lines[1]
  else
    let g:gmail_user_name = input('input mail address:', '@gmail.com')
    let g:gmail_user_pass = inputsecret('input your gmail password:')
    call writefile([g:gmail_user_name, g:gmail_user_pass], expand(account_setting))
  endif
  call gmail#imap#set_password(g:gmail_user_pass)
  call gmail#start()
endfunction

function! s:gmail_account_completion(ArgLead, CmdLine, CursorPos)
  return systemlist('ls ' . expand(g:gmail_account_dir))
endfunction

command! -nargs=* -complete=customlist,s:gmail_account_completion Gm :call s:gmail(<f-args>)
