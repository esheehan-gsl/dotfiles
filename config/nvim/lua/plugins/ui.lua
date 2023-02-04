return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		cmd = { "Telescope" }
	},
	{
		"rcarriga/nvim-notify",
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
			--
			-- Replace default notify function with nvim-notify
			vim.notify = notify
		end,
	},
}
