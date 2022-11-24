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
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'

" Misc.
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Python
Plug 'tmhedberg/SimpylFold'
Plug 'psf/black', { 'branch': 'stable' }

" JS/CSS/HTML
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mattn/emmet-vim'

" File / buffer navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
set wildignore+=*.pyc,*.min.js
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif,*.pdf,*.PDF,*.mov,*.mp4

" Ignore these in ctrl-p, but not wildignore so I can still autocomplete them
" with :e
let g:ctrlp_custom_ignore = '\v\.git|node_modules|build|dist|_site|tmp'
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

syntax on
colorscheme nord

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

let g:airline_theme='nord'

" Set fade color for Limelight
let g:limelight_conceal_ctermfg='gray'
let g:limelight_conceal_guifg='#65737e'

let g:python_highlight_all = 1

au BufNewFile,BufReadPost *.svelte,*.njk,*.webc set syntax=html
" }}}

" Airline {{{
let g:airline_section_z = '☰ %l/%L  : %c'
" }}}

" Black {{{
" Run black before save
autocmd BufWritePre *.py execute ':Black'
" }}}

" Prettier {{{
let g:prettier#autoformat_config_present = 1
" }}}

" FZF {{{
noremap  <C-p> :FZF<CR>
" }}}

" Goyo / Limelight {{{
function! s:goyo_enter()
  Limelight
endfunction

function! s:goyo_leave()
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" Snippets {{{
let g:snipMate = { 'snippet_version' : 1 }
" }}}

" tmux {{{
let g:tmux_navigator_disable_when_zoomed = 1
" }}}

" Local configuration {{{
if filereadable(expand("~/.config/nvim/local.vim"))
  source ~/.config/nvim/local.vim
endif
" }}}
