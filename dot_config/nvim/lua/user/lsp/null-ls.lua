local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local masonok, mason_null_ls = pcall(require, "mason-null-ls")
if masonok then
  mason_null_ls.setup {
    automatic_setup = {
      types = {
        rubocop = { 'formatting' },
      }
    }
  }
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
    on_attach = require("user.lsp.format").on_attach,

    sources = {
        formatting.yapf,
        -- formatting.black.with({ extra_args = { "--fast" } }),
        -- diagnostics.flake8,
        formatting.golines.with({ extra_args = { "-m", "120" }}),
        -- null_ls.builtins.code_actions.gitsigns,
    }
}

if masonok then
  mason_null_ls.setup_handlers()
end
