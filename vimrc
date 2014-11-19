set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'editorconfig-vim'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on
syntax enable

set foldmethod=syntax
set mouse=a
set number
set textwidth=78
set wrap

" Solarized color scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" NERDTree
" Open NERDTree automatically when no files are opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Key bindings
map <C-k><C-b> :NERDTreeToggle<CR>
map <C-S-]> :tabn<CR>
map <C-S-[> :tabp<CR>
