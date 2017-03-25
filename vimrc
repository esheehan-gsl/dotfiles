set nocompatible
filetype off

execute pathogen#infect()

filetype plugin indent on
syntax enable

"set laststatus=2
"set noshowmode

" Display preferences
set cursorline
set number
set textwidth=78
set wrap

set foldmethod=syntax

set backspace=indent,eol,start
set mouse=a

" Solarized color scheme
set background=dark
colorscheme solarized

" Plugin configuration
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
set conceallevel=1

