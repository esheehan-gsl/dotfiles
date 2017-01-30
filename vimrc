set nocompatible
filetype off

set laststatus=2
set showtabline=2
set noshowmode

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'editorconfig-vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'

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

set foldlevel=0
set foldmethod=syntax

set mouse=a

" Solarized color scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

