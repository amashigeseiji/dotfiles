function! vimrc.initialize_with.keymap_rc()
"normal-mode{{{
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap <C-h> hx
nnoremap <S-h> 0
nnoremap <S-l> $
nnoremap <C-g> gT
nnoremap <C-c> gt
" 行頭/行末へ移動
"nnoremap <C-a> 0
nnoremap <C-e> <S-$>
" Ctrl+Nで次のバッファを表示
nnoremap <C-n>   :bnext<CR>
" Ctrl+Pで前のバッファを表示
nnoremap <C-p>   :bprevious<CR>
nnoremap <C-j> :exe("tjump ".expand('<cword>'))<CR>
" tmuxのプレフィックスとかぶるので
nnoremap <C-f> <nop>

nnoremap <space>w :w<CR>
nnoremap <space>q :q<CR>
" タブを開く
"nnoremap t :tabe<space>
" vimrcを編集・読み込み
if exists('g:localvimrc')
  exec 'nnoremap .. :tabe' g:localvimrc '<CR>'
else
  nnoremap .. :tabe ~/.vimrc<CR>
endif
nnoremap ,, :source ~/.vimrc<CR>
nnoremap <silent>,w :setl nowrap!<CR>
nnoremap <silent>,n :setl nonumber!<CR>
nnoremap <silent>,a :append!<CR>
nnoremap <silent>,l :noh<CR>
nnoremap ,fi :setl foldmethod=indent<CR>
nnoremap ,fm :setl foldmethod=marker<CR>
nnoremap ,fs :setl foldmethod=syntax<CR>
nnoremap -- 78i-<esc>o<esc>
"folding {{{
"noremap [space] <nop>
"nmap <space> [space]
nnoremap <space>j zj
nnoremap <space>k zk
nnoremap <space>n ]z
nnoremap <space>p [z
nnoremap <space>h zc
nnoremap <space>l zo
nnoremap <space><space> za
nnoremap <space>a za
nnoremap <space>m zM
nnoremap <space>i zMzv
nnoremap <space>r zR
nnoremap <space>f zf
nnoremap zd <nop>
nnoremap zD <nop>
nnoremap zE <nop>
"}}}
"}}}
"insert-mode{{{
inoremap <C-j> <Esc>
inoremap <C-k> <CR>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap <> <><Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
inoremap <C-l> ->
inoremap <M-l> =>
"}}}
"commandline-mode{{{
cnoremap <C-a> <HOME>
cnoremap <C-e> <End>
cnoremap <C-k> <CR>
cnoremap <C-j> <ESC>
"}}}
"visual-mode{{{
vnoremap <C-j> <esc>
vnoremap <S-l> $
vnoremap <S-h> 0
"行末に挿入
vnoremap <S-a> $<S-a>
vnoremap * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
"}}}
endfunction
