-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim plugins
-- vim: set fdm=marker fdl=0 ts=2 sw=2 tw=80 :

return {
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
	-- TODO: leap.nvim
	-- TODO: 'Pocco81/true-zen.nvim', -- Distraction-free writing
	-- TODO: 'neovim/nvim-lspconfig',
	-- TODO: {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
	-- Python
	-- TODO: 'psf/black',
	-- Web
	-- TODO: 'prettier/vim-prettier',
	-- TODO: 'mattn/emmet-vim',
	-- TODO: surround plugin
	-- TODO: snippets
	-- TODO: toggle comments
	-- TODO: todo plugin
	-- TODO: Dressing.nvim?
	-- TODO: notify
}
