local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local masonok, mason_null_ls = pcall(require, "mason-null-ls")
if masonok then
	mason_null_ls.setup({
		automatic_setup = {
			types = {
				rubocop = { "formatting" },
			},
		},
	})
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	on_attach = require("user.lsp.format").on_attach,

	sources = {
    -- python
		formatting.black,
		diagnostics.ruff,

    -- golang
		formatting.golines.with({ extra_args = { "-m", "120" } }),

    -- ruby
		formatting.rubocop,
		diagnostics.rubocop,
		diagnostics.reek,
	},
})
