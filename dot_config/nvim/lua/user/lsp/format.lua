local M = {
  on_attach = function(client) end,
}

local ok, lspformat = pcall(require, "lsp-format")
if ok then
  M.on_attach = lspformat.on_attach
end

return M
