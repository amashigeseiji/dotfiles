function! VimColorTest(outfile, fgend)
  if !filereadable(a:outfile)
    let resultf = []
    let resultb = []
    for fg in range(a:fgend)
      "foeground
      let kw = printf('%-7s', printf('c_%d', fg))
      let hiforeground = printf('  hi %s ctermfg=%d', kw, fg)
      let sf = printf('syn keyword %s %s', kw, kw)
      "background
      let bw = printf('%-7s', printf('b_%d', fg))
      let hibackground = printf('  hi %s ctermbg=%d', bw, fg)
      let sb = printf('syn keyword %s %s', bw, bw)

      call add(resultf, printf('%-32s | %s', hiforeground, sf))
      call add(resultb, printf('%-32s | %s', hibackground, sb))
    endfor
    call writefile(resultf, a:outfile)
    call writefile(readfile(a:outfile)+resultb, a:outfile)
  endif

  execute 'split'
  execute 'view '.a:outfile
  setlocal nonumber
  execute 'map <buffer><silent> q :bd<CR>'
  source %
endfunction
" Increase numbers in next line to see more colors.
command! VimColorTest call VimColorTest('/tmp/vim-color-define', 255)
