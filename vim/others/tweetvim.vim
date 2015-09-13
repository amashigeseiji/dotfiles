let g:tweetvim_display_username = 0
let g:tweetvim_tweet_per_page = 30
let g:tweetvim_display_icon = 1
let g:tweetvim_open_buffer_cmd = 'split!'
let g:tweetvim_align_right = 1

nnoremap ,tl :<C-u>TweetVimUserStream<CR>
au Filetype tweetvim setl nonumber
