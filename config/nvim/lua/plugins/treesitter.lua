return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Shrink selection", mode = "x" },
		},
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			-- TODO: What this do?
			context_commentstring = { enable = true, enabled_autocmd = false },
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
				"markdown_inline",
				"python",
				"regex",
				"scss",
				"svelte",
				"vim",
				"vue",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
