require "user.colorscheme"
require "user.options"

-- plugin configuration
require "user.plugins"
require "user.autocmds"
require "user.autopairs"
require "user.comments"
require "user.cmp"
require "user.gitsigns"
require "user.lsp"
require "user.lualine"
require "user.nvim-tree"
require "user.telescope"
require "user.treesitter"
require "user.bufferline"
require "user.toggleterm"

-- important that they go last to overwrite some system keymaps
-- like `space-e` for some diagnostics stuff (maybe I need it later?!)
require "user.keymaps"
