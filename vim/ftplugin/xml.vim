setl foldmethod=syntax
inoremap <buffer> </ </<C-x><C-o>
nnoremap <silent><buffer> ,l 1,$!xmllint --format --recover - 2>/dev/null

source $VIMRUNTIME/macros/matchit.vim
