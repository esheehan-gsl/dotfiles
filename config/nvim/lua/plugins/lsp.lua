return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		-- BUG: errors regarding lua-language-server
		enabled = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- TODO: Add "hrsh7th/cmp-nvim-lsp" for additional completion capabilities?
			-- TODO: folke/neoconf.nvim for project local config?
			-- TODO: "folke/neodev.nvim" for NeoVim lua completions? Needs cmp-nvim-lsp?
		},
		keys = {
			{ "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
			{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
			{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{ "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
			{ "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
			{ "K", vim.lsp.buf.hover, desc = "Hover" },
			-- { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
			-- { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
			{ "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
			{ "[d", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
			{ "]e", function () vim.diagnostic.goto_next({ severity = "ERROR" }) end, desc = "Next Error" },
			{ "[e", function () vim.diagnostic.goto_prev({ severity = "ERROR" }) end, desc = "Prev Error" },
			{ "]w", function () vim.diagnostic.goto_next({ severity = "WARN" }) end, desc = "Next Warning" },
			{ "[w", function () vim.diagnostic.goto_prev({ severity = "WARN" }) end, desc = "Prev Warning" },
			-- { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
			-- { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
			-- { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
			{ "<leader>cr", vim.lsp.buf.rename, expr = true, desc = "Rename" },
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
			},
			servers = {
				"bashls",
				"cssls",
				"dockerls",
				"eslint",
				"emmet_ls",
				-- "flake8",
				"html",
				"jsonls",
				"pyright",
				-- "shellcheck",
				-- "shfmt",
				-- "stylelua",
				-- "sumneko_lua",
				"svelte",
				"taplo", -- TOML
				"tsserver",
				"vimls",
				"yamlls",
			},
			setup = {
				-- setup handlers for mason-lspconfig
			}
		},
		config = function(plugin, opts)
			vim.diagnostic.config(opts.diagnostics)

			-- TODO: Configure autoformat

			local servers = opts.servers

			local function setup(server)
				local server_opts = servers[server] or {}

				require("lspconfig")[server].setup(server_opts)
			end

			local mlsp = require("mason-lspconfig")
			mlsp.setup({ ensure_installed = servers })
			mlsp.setup_handlers({ setup })
		end,
	},

	-- TODO: null-ls.nvim for formatting with lsp?
}
