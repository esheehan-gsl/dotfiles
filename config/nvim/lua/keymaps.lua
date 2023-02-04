-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim keybindings
-- vim: set fdm=marker fdl=0 ts=2 sw=2 noet tw=80 :

-- Window resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv==gv", { desc = "Move down" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", ":m '>-2<cr>gv==gv", { desc = "Move up" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to other buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to other buffer" })

-- Clear search with <Esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Lazy
-- TODO: Is this : necessary, or can it just be <cmd>Lazy<cr>?
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- Telescope
-- TODO: descriptions for which-key
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>f/", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<cr>")

-- Testing
-- vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
-- vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
-- vim.keymap.set("n", "<leader>a", ":TestSuite<CR>")
-- vim.keymap.set("n", "<leader>l", ":TestLast<CR>")
-- vim.keymap.set("n", "<leader>g", ":TestVisit<CR>")
