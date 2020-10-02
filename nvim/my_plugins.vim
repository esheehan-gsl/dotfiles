call plug#begin(expand('$HOME/.config/nvim/plug'))

" Color
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'hhsnopek/vim-firewatch'

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
" Until https://github.com/psf/black/issues/1304 is fixed I need to pin Black to
" this tag
Plug 'psf/black', { 'tag': '19.10b0' }

" JS/CSS/HTML
Plug 'prettier/vim-prettier'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'

" File / buffer navigation
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
