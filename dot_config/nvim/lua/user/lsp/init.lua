local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local format = require("user.lsp.format")
require("user.lsp.lspsaga")

local keymaps = require("user.lsp.keymaps")
keymaps.config_global_keymaps()

local on_attach = function(client, bufnr)
  keymaps.on_attach(client, bufnr)
  format.on_attach(client, bufnr)
end

lspconfig.pyright.setup{
    on_attach = on_attach,
}

lspconfig.gopls.setup {
    on_attach = on_attach,
}

lspconfig.solargraph.setup {
    on_attach = on_attach,
	  flags = {
	      debounce_text_changes = 150,
	  },
}

local ok, mason = pcall(require, "mason")
if ok then
  mason.setup {}
end

require("user.lsp.null-ls")
