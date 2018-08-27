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

" Plugins {{{
call plug#begin(expand('$HOME/.config/nvim/plug'))

Plug 'mhartington/oceanic-next'

Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'

" LanguageServer completion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'autozimu/languageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" File / buffer navigation
Plug 'kien/ctrlp.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

call plug#end()
" }}}

" Colors {{{
if (has("termguicolors"))
 set termguicolors
endif

syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
" }}}

