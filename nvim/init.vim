" Author: Evan Sheehan <esheehan@fastmail.com>
" Description: NeoVim configuration
" vim: set fdm=marker fdl=0 ts=2 sw=2 et tw=80 :

" I love me some line numbers.
set number
set relativenumber

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

" Plugins
source ~/.config/nvim/my_plugins.vim

" Automatically resize splits when the window is resized. Important for
" good behavior with tmux splits
autocmd VimResized * :wincmd =

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("B:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules',
  \ }

" Folding {{{
set foldenable
set foldlevel=1
set foldmethod=syntax
" }}}

" Undo {{{
" Store undo history to a file that can be restored whenever
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=1000
" }}}

" Code Completion {{{
" Enable ncm2 in all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'python': ['pyls']
  \ }

inoremap <C-space> <C-O>:call LanguageClient#textDocument_completion()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" }}}

" Colors {{{

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme nord

let g:python_highlight_all = 1
let g:airline_theme='nord'

au BufReadPost *.svelte set syntax=html
" }}}

" Local configuration {{{
if filereadable(expand("~/.config/nvim/local.vim"))
  source ~/.config/nvim/local.vim
endif
" }}}
