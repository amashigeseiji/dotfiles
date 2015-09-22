" この設定入れるとshiftwidthを1にしてインデントしてくれる
"let g:SimpleJsIndenter_BriefMode = 2
"" この設定入れるとswitchのインデントがいくらかマシに
"let g:SimpleJsIndenter_CaseIndentLevel = -1
"let g:syntastic_javascript_checkers=['gjslint']
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! s:FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=s:FoldText()
endfunction

call JavaScriptFold()
setl fen
setl autoindent
setl smartindent
setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
