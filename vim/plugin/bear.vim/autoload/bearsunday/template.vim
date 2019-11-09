function! bearsunday#template#newFile(snippet)
  let l:input = expand(a:snippet)
  let l:templ = []
  for line in readfile(l:input)
    call add(l:templ, s:Subst(line))
  endfor
  return setline('.', l:templ)
endfunction

function! s:Subst(line)
  let l:line = a:line
  if l:line =~ "`namespace`"
    let line = substitute(line, '`namespace`', escape(bearsunday#composer#namespace(), '\'), 'g')
  elseif line =~ "`class`"
    let line = substitute(line, '`class`', expand("%:t:r"), 'g')
  endif
  return line
endfunction
