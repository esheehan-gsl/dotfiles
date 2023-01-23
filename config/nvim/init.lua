-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim configuration
-- vim: set fdm=marker fdl=0 ts=2 sw=2 noet tw=80 :

-- Load the basic vim configuration from .vimrc. I keep some basic set up like
-- line numbers in the old ~/.vimrc location for any time I end up not having
-- access to NeoVim.
vim.cmd.source(vim.fn.expand('$HOME')..'/.vimrc')

require('config/plugins')
require('config/lsp')

-- Ignore {{{
vim.opt.wildignore:append({'*.pyc', '*.min.js'})
vim.opt.wildignore:append({'*.png', '*.PNG', '*.JPG', '*.jpg', '*.JPEG', '*.jpeg', '*.GIF', '*.gif', '*.pdf', '*.PDF', '*.mov', '*.mp4'})
-- }}}

-- Folding {{{
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'syntax'

-- SimpylFold
vim.g.SimpylFold_docstring_preview = 1
-- }}}

-- Undo {{{
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data')..'/undo'
vim.opt.undolevels = 10000
vim.opt.undoreload = 1000
-- }}}

-- Colors {{{
-- let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if vim.fn.has('termguicolors') then
 vim.opt.termguicolors = true
end

vim.cmd.syntax('on')
vim.cmd.colorscheme('nord')

-- Enable transparent background
vim.cmd([[
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE
]])

vim.g.airline_theme = 'nord'

vim.g.python_highlight_all = 1
-- }}}

-- Syntax highlighting {{{
vim.api.nvim_create_autocmd({'BufNewFile', 'BufReadPost'}, {
	pattern = {'*.svelte', '*.njk', '*.webc'},
	command = 'set syntax=html',
})
-- }}}

-- Airline {{{
vim.g['airline#extensions#branch#displayed_head_limit'] = 12
vim.g.airline_section_z = '☰ %l/%L  : %c'
-- }}}

-- FZF {{{
vim.keymap.set('n', '<C-p>', ':GFiles<CR>')
-- }}}

-- Testing {{{
vim.g['test#strategy'] = 'asyncrun_background'

vim.keymap.set('n', '<leader>t', ':TestNearest<CR>')
vim.keymap.set('n', '<leader>T', ':TestFile<CR>')
vim.keymap.set('n', '<leader>a', ':TestSuite<CR>')
vim.keymap.set('n', '<leader>l', ':TestLast<CR>')
vim.keymap.set('n', '<leader>g', ':TestVisit<CR>')
--

-- Linting / Formatting {{{
-- Python
vim.api.nvim_create_autocmd({'BufWritePre'}, {
	pattern = {'*.py'},
	command = ':Black'
})

-- HTML/CSS/JS
vim.g['prettier#autoformat_config_present'] = 1
-- }}}

-- Distraction-free writing {{{
require('true-zen').setup()
-- }}}

-- Snippets {{{
vim.g.snipMate = { snippet_version = 1 }
-- }}}

-- Local config {{{
local ok, local_config = pcall(require, 'config/local')
if ok then
  print('Loaded local config')
end
-- }}}
