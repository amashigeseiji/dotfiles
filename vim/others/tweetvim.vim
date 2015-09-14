let g:tweetvim_display_username = 0
let g:tweetvim_tweet_per_page = 30
let g:tweetvim_display_icon = 1
let g:tweetvim_open_buffer_cmd = 'split!'

nnoremap ,tl :<C-u>TweetVimUserStream<CR>
au Filetype tweetvim setl nonumber

augroup TweetVimSetting
  au!
  au Filetype tweetvim_say nnoremap <buffer><silent>q :bd!<CR>
  au Filetype tweetvim     nnoremap <buffer><silent>s :<C-u>TweetVimSay<CR>
augroup END

if !has('gui_running')
  hi def link tweetvim_title           Title
  hi def link tweetvim_status_id       Special
  hi def link tweetvim_created_at      NonText
  hi tweetvim_screen_name              ctermfg=209
  hi def link tweetvim_at_screen_name  StorageClass
  hi tweetvim_link                     ctermfg=111 cterm=underline
  hi def link tweetvim_hash_tag        Typedef
endif
