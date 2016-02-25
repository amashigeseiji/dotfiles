let g:user_emmet_expandabbr_key = '<C-@>'
let g:user_emmet_leader_key = '<C-i>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby,php EmmetInstall
"let g:user_emmet_settings = webapi#json#decode(
"\  join(readfile(expand('~/.snippets_custom.json')), "\n"))
