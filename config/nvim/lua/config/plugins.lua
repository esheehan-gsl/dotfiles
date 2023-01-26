-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim plugins
-- vim: set fdm=marker fdl=0 ts=2 sw=2 tw=80 :

-- Install packer for package management, if it's missing
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Color
	use 'arcticicestudio/nord-vim'
	use 'sheerun/vim-polyglot'

	-- Misc.
	use {'knubie/vim-kitty-navigator', run =  'cp ./*.py ~/.config/kitty/'}
	use 'editorconfig/editorconfig-vim'
	use 'thaerkh/vim-indentguides'
	use 'tpope/vim-commentary'
	use 'tpope/vim-dispatch'
	use 'tpope/vim-jdaddy'
	use 'tpope/vim-surround'
	use 'easymotion/vim-easymotion'
	use 'vim-test/vim-test'
	-- For vim-test
	use 'skywind3000/asyncrun.vim'

	-- Distraction-free writing
	use 'Pocco81/true-zen.nvim'

	-- Snippets
	-- vim-addon-mw-utils and tlib_vim are dependencies for vim-snipmate
	use 'MarcWeber/vim-addon-mw-utils'
	use 'tomtom/tlib_vim'
	use 'garbas/vim-snipmate'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- Python
	use 'psf/black'

	-- JS/CSS/HTML
	use 'prettier/vim-prettier'
	use 'mattn/emmet-vim'

	-- File / buffer navigation
	use {'junegunn/fzf', run = function() vim.fn["fzf#install"]() end}
	use 'junegunn/fzf.vim'

	-- Git
	use 'tpope/vim-fugitive'
	use 'airblade/vim-gitgutter'

	-- Statusline
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
