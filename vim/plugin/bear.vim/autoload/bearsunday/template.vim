function! bearsunday#template#newFile(snippet)
  let l:input = expand(a:snippet)
  let l:templ = []
  for line in readfile(l:input)
    if line =~ "`namespace`"
      let line = substitute(line, '`namespace`', escape(bearsunday#composer#namespace(), '\'), 'g')
    elseif line =~ "`class`"
      let line = substitute(line, '`class`', expand("%:t:r"), 'g')
    endif
    call add(l:templ, line)
  endfor
  return setline('.', l:templ)
endfunction
