" Author: Evan Sheehan <esheehan@fastmail.com>
" Description: Basic vim configuration
" vim: set fdm=marker fdl=0 ts=2 sw=2 et tw=80 :

" I love me some line numbers.
set relativenumber

" Center the cursor
set scrolloff=999

" Highlight the line with the cursor
set cursorline

" Decrease the update time to 100 milliseconds for vim-gitgutter
set updatetime=100

set noswapfile

" Ignore case as long as the query contains no capital letters.
set ignorecase smartcase

" Just because it's a terminal doesn't mean I can't use a mouse
set mouse=a

" Add some keybindings for the quickfix window
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

