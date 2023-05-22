-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim plugins
-- vim: set fdm=marker fdl=0 ts=2 sw=2 tw=80 :

return {
	{
		"preservim/vim-colors-pencil",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme pencil]])
		end,
	},
	{ "editorconfig/editorconfig-vim", lazy = false },
	{ "knubie/vim-kitty-navigator", lazy = false, build = "cp ./*.py ~/.config/kitty/" },
	{
		"vim-test/vim-test",
		dependencies = { "skywind3000/asyncrun.vim" },
		cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
	},
	{
		"ggandor/leap.nvim",
		dependencies = { "ggandor/flit.nvim", "tpope/vim-repeat" },
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	-- TODO: 'Pocco81/true-zen.nvim', -- Distraction-free writing
	-- Python
	-- TODO: 'psf/black',
	-- Web
	-- TODO: 'prettier/vim-prettier',
	-- TODO: 'mattn/emmet-vim',
	-- TODO: snippets
	-- TODO: Dressing.nvim?
}
