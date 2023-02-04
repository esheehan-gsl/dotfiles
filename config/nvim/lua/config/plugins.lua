-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim plugins
-- vim: set fdm=marker fdl=0 ts=2 sw=2 tw=80 :

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- Install lazy.nvim
	vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'arcticicestudio/nord-vim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme nord]])
		end,
	},
	{'editorconfig/editorconfig-vim', lazy = false },
	{'knubie/vim-kitty-navigator', build = 'cp ./*.py ~/.config/kitty/'},
	{
		'vim-test/vim-test',
		dependencies = { 'skywind3000/asyncrun.vim' },
		cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit"}
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		cmd = { "Telescope" }
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	-- 'Pocco81/true-zen.nvim', -- Distraction-free writing
	-- 'neovim/nvim-lspconfig',
	-- {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
	-- Python
	-- 'psf/black',
	-- Web
	-- 'prettier/vim-prettier',
	-- 'mattn/emmet-vim',
})
