" vim: set foldmethod=marker:
" Vim color file
" Author: Seiji Amashige <tenjuu99@gmail.com>
" Note: Based on the monokai

hi clear

"set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="mycolor"

"gui{{{
if has('gui_running')
  " highlight groups
  hi Cursor	guibg=khaki guifg=slategrey

  hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
  hi Folded	guibg=#292929 guifg=#6666aa gui=bold
  hi FoldColumn	guibg=grey30 guifg=tan
  hi IncSearch	guifg=slategrey guibg=khaki
  hi ModeMsg	guifg=goldenrod
  hi MoreMsg	guifg=SeaGreen
  hi Question	guifg=springgreen
  hi Search	guibg=peru guifg=wheat
  hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
  hi StatusLineNC	guibg=#928f75 guifg=grey42 gui=none
  hi Title	guifg=indianred
  hi Visual	gui=none guifg=khaki guibg=olivedrab
  "hi VisualNOS
  hi WarningMsg	guifg=salmon
  "hi WildMenu
  "hi Menu
  "hi Tooltip

  " syntax highlighting groups
  hi Constant	guifg=#ffa0a0
  hi Identifier	guifg=palegreen
  hi Statement	guifg=khaki
  hi PreProc	guifg=indianred
  hi Type		guifg=darkkhaki
  hi Special	guifg=navajowhite
  "hi Underlined
  hi Ignore	guifg=grey40
  "hi Error
  hi Todo		guifg=orangered guibg=yellow2
endif
"}}}

"cui{{{
if &t_Co > 255
   hi Boolean         ctermfg=205
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=101
   hi Conditional     ctermfg=170
   hi Constant        ctermfg=39                cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=79
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102   cterm=bold

   hi Directory       ctermfg=110               cterm=bold
   hi Error           ctermfg=199  ctermbg=53
   hi ErrorMsg        ctermfg=125  ctermbg=none cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=236
   hi Function        ctermfg=120
   hi Identifier      ctermfg=137
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=180
   hi MoreMsg         ctermfg=180
   hi Operator        ctermfg=209

   " complete menu{{{
   hi Pmenu           ctermfg=7   ctermbg=8
   hi PmenuSel                    ctermbg=138   cterm=bold
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=116               cterm=bold
   hi PreProc         ctermfg=101
   hi Question        ctermfg=81
   hi Repeat          ctermfg=178
   hi Search          ctermfg=253 ctermbg=66
   "}}}

   " marks column{{{
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=73  ctermbg=232

   hi Statement       ctermfg=170           cterm=bold
   hi StatusLine      ctermfg=023 ctermbg=251
   hi StatusLineNC    ctermfg=240 ctermbg=235
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=80
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=69                cterm=none
   hi Underlined      ctermfg=72                cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=238
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16
   "}}}
end
"}}}

" 通常の表示
hi Normal               ctermfg=248 ctermbg=234 guifg=White guibg=grey18
" 行番号
hi LineNr               ctermfg=238 ctermbg=234 guifg=#777777
" コメント
hi Comment              ctermfg=237 guifg=#666666
" special keys
hi SpecialKey           term=underline ctermfg=darkgray ctermbg=black guifg=grey30 guibg=grey20
hi IdeographicSpace     term=underline ctermbg=DarkGreen guibg=DarkGreen
hi NonText              ctermfg=darkGray ctermbg=234 guifg=#777777 guibg=grey20
hi Tag                  ctermfg=216  guifg=#f2ddb0
"tab{{{
" 選択されているタブ
hi TabLineSel           ctermfg=187 ctermbg=16 cterm=bold,underline guifg=#88cc88 guibg=#403333 gui=bold,underline
hi TabLineSelPageInfo   ctermfg=208 ctermbg=16 guifg=#ffbb55 gui=bold
" その他のタブ
hi TabLine              term=reverse cterm=reverse ctermfg=238 ctermbg=236 gui=none guifg=#444444 guibg=#666666
hi TabLinePageInfo      term=reverse cterm=reverse ctermfg=238 ctermbg=236 gui=none guifg=#444444 guibg=#666666
" 空いているところ
hi TabLineFill          term=reverse cterm=reverse ctermfg=059 ctermbg=041 gui=reverse guifg=LightGray
" info
hi TabLineInfo          term=reverse ctermfg=white ctermbg=black guifg=#009933 guibg=lightgray gui=bold
" 隙間
hi TabLineGap           ctermbg=248 guibg=grey30
"}}}
