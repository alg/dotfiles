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
    -- you can reuse a shared lspconfig on_attach callback here
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 vim.lsp.buf.format({ bufnr = bufnr })
    --             end,
    --         })
    --     end
    -- end,

    sources = {
        formatting.black.with({ extra_args = { "--fast" } }),
        diagnostics.flake8,
        formatting.golines.with({ extra_args = { "-m", "120" }}),
        -- null_ls.builtins.code_actions.gitsigns,
    }
}

if masonok then
  mason_null_ls.setup_handlers()
end
