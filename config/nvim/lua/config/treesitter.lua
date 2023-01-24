require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"bash",
		"c",
		"css",
		"diff",
		"dockerfile",
		"fish",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"help",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"markdown",
		"python",
		"regex",
		"scss",
		"svelte",
		"vim",
		"vue",
	},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
