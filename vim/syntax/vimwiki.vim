syn match vimwikiListOfNumber '\s\+\d\+\.'
hi link vimwikiListOfNumber Number
syn match vimwikiEnglishTitle '【.*】'
hi link vimwikiEnglishTitle Statement
syn match vimwikiSupplement '〔[^〕]*〕'
hi link vimwikiSupplement Comment
syn match vimwikiEnglishCategory '《[^》]*》'
hi link vimwikiEnglishCategory Tag
