set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlp.vim'
Plugin 'darthmall/vim-vue'
Plugin 'editorconfig-vim'
Plugin 'ehamberg/vim-cute-python'
Plugin 'gmarik/Vundle.vim'
Plugin 'groenewege/vim-less'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/Align'
Plugin 'wookiehangover/jshint.vim'

call vundle#end()

filetype plugin indent on
syntax enable

" Allow local .vimrc for project-specific settings
set exrc
set secure

" Display preferences
set cursorline
set number
set textwidth=78
set wrap

" For cute-python and javascript plugins to replace reserved words with
" unicode characters
set cole=1

set foldlevel=1
set foldmethod=syntax

set mouse=a

" Solarized color scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" NERDTree
" Open NERDTree automatically when no files are opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim-javascript
let g:javascript_enable_domhtmlcss=1
let g:javascript_conceal=1

" Key bindings
map <C-k><C-b> :NERDTreeToggle<CR>
map <C-S-]> :tabn<CR>
map <C-S-[> :tabp<CR>
