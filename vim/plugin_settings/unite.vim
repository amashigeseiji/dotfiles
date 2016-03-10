let g:unite_data_directory = '/tmp/.unite'
let g:unite_source_history_yank_enable = 1  "history/yankの有効化
" 入力モードで開始する
let g:unite_enable_start_insert = 1
" バッファ一覧
noremap <C-u><C-b> :Unite buffer<CR>
" ファイル一覧
noremap <C-u>f :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-u><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-u>y :Unite -buffer-name=register register<CR>
" function
nnoremap f :Unite outline<CR>
"nnoremap <C-u>f :Unite function<CR>
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>