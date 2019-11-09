function! bearsunday#resource#call(...)
  echo join(a:000)
  let l:res = system('php bin/app.php ' . join(a:000, ' '))
  let l:json = matchstr(l:res, '\({.*}\)')
  call setqflist(json_decode(l:json), 'r')
  cwindow
endfunction

function! bearsunday#resource#completion(ArgLead, CmdLine, CursorPos)
  let l:cmd = split(a:CmdLine)
  let l:len_cmd = len(l:cmd)

  if l:len_cmd <= 1
    let l:filter_cmd = printf('v:val =~ "^%s"', a:ArgLead)
    return filter(['options', 'get', 'post', 'put', 'patch', 'delete', 'head'], l:filter_cmd)
  endif
endfunction
