" この設定入れるとshiftwidthを1にしてインデントしてくれる
"let g:SimpleJsIndenter_BriefMode = 2
"" この設定入れるとswitchのインデントがいくらかマシに
"let g:SimpleJsIndenter_CaseIndentLevel = -1
function! JavaScriptFold()  " {{{
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction  "}}}

augroup JsRead
  au!
  au FileType javascript call JavaScriptFold()
  au FileType javascript setl fen
  autocmd FileType javascript setl autoindent
  autocmd FileType javascript setl smartindent
  autocmd FileType javascript setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
augroup END
"let g:syntastic_javascript_checkers=['gjslint']
augroup Coffee
  au!
  au BufRead,BufNewFile,BufReadPre *.coffee setl filetype=coffee
  au FileType coffee     setlocal sw=2 sts=2 ts=2 et
augroup END
