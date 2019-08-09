call plug#begin(expand('$HOME/.config/nvim/plug'))

Plug 'mhartington/oceanic-next'
Plug 'hhsnopek/vim-firewatch'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'

Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'ekalinin/Dockerfile.vim'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" LanguageServer completion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'autozimu/languageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

Plug 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'niftylettuce/vim-jinja'

" File / buffer navigation
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
