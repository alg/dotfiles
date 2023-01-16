require "user.options"

-- plugin configuration
require "user.plugins"
require "user.colorscheme"
require "user.autocmds"
require "user.lsp"

-- important that they go last to overwrite some system keymaps
-- like `space-e` for some diagnostics stuff (maybe I need it later?!)
require "user.keymaps"
