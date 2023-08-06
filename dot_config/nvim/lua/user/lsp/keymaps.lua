local M = {}

M.config_global_keymaps = function()
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
end

local with_lspsaga, _ = pcall(require, 'lspsaga')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts)

    if with_lspsaga then
      vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
      vim.keymap.set("n", "gi", "<cmd>Lspsaga incoming_calls<CR>", bufopts)
      vim.keymap.set("n", "go", "<cmd>Lspsaga outgoing_calls<CR>", bufopts)
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
      vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
      vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
      vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_buf_diagnostics<CR>", bufopts)
      vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
      vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
      vim.keymap.set("n", "[E", function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, bufopts)
      vim.keymap.set("n", "]E", function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end, bufopts)
      vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>",bufopts)
    else
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'go', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
      vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    end
end

return M
