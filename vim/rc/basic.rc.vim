" base settings
function! vimrc.initialize_with.basic_rc()
  let g:OSTYPE = system('uname')
  if g:OSTYPE == "Darwin\n"
    let $PATH = $PATH.':/usr/local/bin/'
    if exists('+macmeta')
      set macmeta
    endif
  endif
  " encording
  set encoding=utf-8
  set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
  set termencoding=utf-8
  "set fileencodings=utf-8
  set clipboard=unnamed,autoselect
  set iminsert=0
  set imsearch=0
  "set imdisable
  set iskeyword=@,48-57,_,128-167,224-235
  set backspace=indent,eol,start
  set visualbell t_vb=

  set incsearch
  set ignorecase         " 検索時に大文字小文字を無視
  set smartcase          " 大文字小文字の両方が含まれている場合は大文字小文字を区別
  set wrapscan           " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
  "set grepprg=ack\ -a
  set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
  set grepprg=grep\ -nH
  set hlsearch

  set tabstop=2          " タブの画面上での幅
  set expandtab          " タブをスペースに展開しない
  set shiftwidth=2       " autoindentなどの時のタブ幅
  set softtabstop=2
  set smartindent
  set autoindent
  set showmatch          " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)

  "viminfo // see :help 23.1
  "set viminfo='1000,f1,<500,s100
  "set viminfo+=n~/tmp/viminfo
  "set showmode

  set list               " タブや改行を表示 (list:表示)
  set listchars=tab:>-,extends:<,trail:-,eol:$ " どの文字でタブや改行を表示するかを設定

  set number
  set wrap
  set noruler
  set cmdheight=2
  "set showcmd

  set wildmenu        " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
  set wildmode=list:full,full " コマンドライン補完をシェルっぽくする
  " statusline
  set laststatus=2  " 常にステータス行を表示
  " tabline
  set showtabline=2

  set autoread     "他で書き換えられた場合、自動で読みなおす
  set noswapfile
  set nobackup     " バックアップファイルを作成しない
  "undo file
  if has('persistent_undo')
    set noundofile
  endif
  set history=50

  set ambiwidth=double

  set splitbelow
  set splitright
  set virtualedit+=block " 矩形選択で行末を超えてブロックを選択できるようにする

  " foldings
  set foldmethod=marker
  set foldopen=hor,search,insert,jump,tag
  "set foldclose=all
  set modeline

  " gq でコメントをフォーマットする
  set formatoptions=tcrqm
  set textwidth=0

  " only 200 characters are highlight
  set synmaxcol=1000

  set helplang=ja,en
  "ctags
  set tags=./tags;

  "ファイルの閉じた場所を記憶
  augroup RememberCursorPos
    au!
    au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
  augroup END
  augroup Help
    au!
    au FileType help noremap <buffer><silent> q :bd<CR>
  augroup END

  " matchit
  if !exists('g:loaded_matchit')
    runtime macros/matchit.vim
  endif
  let b:match_words = "if:endif,foreach:endforeach,\<begin\>:\<end\>"
  let b:match_ignorecase = 1

  " too slow default matcher
  let g:loaded_matchparen = 1

  syntax on
  filetype plugin indent on

endfunction
