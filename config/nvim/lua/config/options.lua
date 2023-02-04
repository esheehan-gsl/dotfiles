-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim options
-- vim: set fdm=marker fdl=0 ts=2 sw=2 noet tw=80 :

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.breakindent = true
opt.clipboard = "unnamedplus" -- Sync with the system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm saving changes before exiting a modified buffer
opt.cursorline = true
opt.foldenable = true
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.laststatus = 0 -- No status line when there's only one window
opt.linebreak = true
opt.mouse = "a"
opt.number = true
opt.path:append("**")
opt.pumblend = 10 -- popup-menu transparency
opt.pumheight = 10 -- 10 entries in a popup
opt.relativenumber = true
opt.scrolloff = 3
opt.shiftround = true
opt.shortmess:append { W = true, I = true }
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 1000
opt.updatetime = 200
opt.wildignore:append({"*.png", "*.PNG", "*.JPG", "*.jpg", "*.JPEG", "*.jpeg", "*.GIF", "*.gif", "*.pdf", "*.PDF", "*.mov", "*.mp4"})
opt.wildignore:append({"*.pyc", "*.min.js"})
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false

-- From LazyVim
-- Fix markdown indentation settings
vim.g.markdown_recommend_style = 0
