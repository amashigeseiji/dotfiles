let g:gmail_nomove_after_select = 1
let g:gmail_signature = "Amashige Seiji (sent from gmail.vim)"
let g:gmail_mailbox_trash = '[Gmail]/ゴミ箱'
let g:gmail_default_encoding = 'utf-8'

augroup gmail
  au Filetype gmail cnoremap <buffer><silent> q :GmailExit<CR>
augroup END

function! s:gmail(...)
  let s:gmail_account_dir = '~/.gmail.vim/'
  let s:gmail_default_account = s:gmail_account_dir . 'default'

  if !isdirectory(expand(s:gmail_account_dir))
    call mkdir(expand(s:gmail_account_dir), 'p', 0700)
  endif

  if len(a:000) == 0
    let account_setting = s:gmail_default_account
  else
    let account_setting = s:gmail_account_dir . a:000[0]
  endif

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

command! -nargs=* Gm :call s:gmail(<f-args>)
