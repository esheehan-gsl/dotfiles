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
