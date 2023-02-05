return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			-- TODO register prefixes with names
			require("which-key").setup({})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		-- TODO: Move keybindings here
		-- TODO: Add keybinding for notify
		cmd = { "Telescope" },
		config = function(_, opts)
			local tele = require("telescope")
			tele.setup(opts)
			tele.load_extension("notify")
		end,
	},
	{
		-- TODO: Add nerdfont for icons? Or change how notifications are displayed?
		"rcarriga/nvim-notify",
		lazy = false,
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Clear notifications",
			},
		},
		opts = {
			timeout = 3000,
		},
		config = function(_, opts)
			local notify = require("notify")
			notify.setup(opts)

			-- Replace default notify function with nvim-notify
			vim.notify = notify
		end,
	},
}
