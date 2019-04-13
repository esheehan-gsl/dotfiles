call plug#begin(expand('$HOME/.config/nvim/plug'))

Plug 'hhsnopek/vim-firewatch'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'

Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'

" LanguageServer completion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'autozimu/languageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

Plug 'niftylettuce/vim-jinja'

" File / buffer navigation
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
