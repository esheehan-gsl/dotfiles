" Author: Evan Sheehan <esheehan@fastmail.com>
" Description: NeoVim configuration
" vim: set fdm=marker fdl=0 ts=2 sw=2 et tw=80 :

" Load the basic vim configuration from .vimrc. I keep some basic set up like
" line numbers in the old ~/.vimrc location for any time I end up not having
" access to NeoVim.
source ~/.vimrc

" Plugins {{{
call plug#begin(expand('$HOME/.config/nvim/plug'))

" Color
Plug 'chriskempson/base16-vim'

" Misc.
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Docker syntax
Plug 'ekalinin/Dockerfile.vim'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Python
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'niftylettuce/vim-jinja'
Plug 'psf/black', { 'branch': 'stable' }

" JS/CSS/HTML
Plug 'prettier/vim-prettier'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'

" File / buffer navigation
Plug 'kien/ctrlp.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
"}}}

" Ignore {{{
" Exclude project cruft from auto-complete/ctrl-p
set wildignore+=*/.git/*,*/node_modules/*
set wildignore+=*/dist/*,*/_site/*
set wildignore+=*.pyc,*.min.js
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif,*.pdf,*.PDF,*.mov,*.mp4
"}}}

" Folding {{{
set foldenable
set foldlevel=99
set foldmethod=syntax

" Toggle folds with space
nnoremap <space> za

" SimpylFold
let g:SimpylFold_docstring_preview = 1
" }}}

" Undo {{{
" Store undo history to a file that can be restored whenever
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=1000
" }}}

" Colors {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme base16-grayscale-light

let g:python_highlight_all = 1

au BufReadPost *.svelte set syntax=html
" }}}

" Airline {{{
let g:airline_section_z = '☰ %l/%L  : %c'
" }}}

" Black {{{
" Run black before save
autocmd BufWritePre *.py execute ':Black'
" }}}
" Local configuration {{{
if filereadable(expand("~/.config/nvim/local.vim"))
  source ~/.config/nvim/local.vim
endif
" }}}
