-- Author: Evan Sheehan <darth_mall@pm.me>
-- Description: NeoVim configuration
-- vim: set fdm=marker fdl=0 ts=2 sw=2 noet tw=80 :

require("config/options");
require("config/plugins")
-- require("config/lsp")
-- require("config/treesitter")
require("config/autocmds");
require("config/keymaps");

-- Testing {{{
vim.g["test#strategy"] = "asyncrun_background"

-- HTML/CSS/JS
vim.g["prettier#autoformat_config_present"] = 1
-- }}}

-- Local config {{{
local ok, local_config = pcall(require, "config/local")
if ok then
  print("Loaded local config")
end
-- }}}
