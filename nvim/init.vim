" Author: Evan Sheehan <esheehan@fastmail.com>
" Description: NeoVim configuration
" vim: set fdm=marker fdl=0 ts=2 sw=2 et tw=80 :

" I love me some line numbers.
set number

" Decrease the update time to 100 milliseconds for vim-gitgutter
set updatetime=100

set noswapfile

" Ignore case as long as the query contains no capital letters.
set ignorecase smartcase

" Just because it's a terminal doesn't mean I can't use a mouse
set mouse=a

" Plugins
source ~/.config/nvim/my_plugins.vim

" Automatically resize splits when the window is resized. Important for
" good behavior with tmux splits
autocmd VimResized * :wincmd =

map <C-k><C-b> :NERDTreeToggle<CR>

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
colorscheme OceanicNext

let g:airline_theme='oceanicnext'
" }}}

