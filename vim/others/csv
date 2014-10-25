function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x
endfunction
command! -nargs=1 Csvhl :call CSVH(<args>)

autocmd BufNewFile,BufRead *.csv set nowrap
