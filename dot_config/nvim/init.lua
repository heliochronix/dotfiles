-- Neovim configuration entry point

-- Load options first (before plugins)
require("config.options")

-- Load and configure lazy.nvim plugin manager
require("config.lazy")

-- Load keymaps (after plugins are loaded)
require("config.keymaps")

-- Load autocommands
require("config.autocmds")
