vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 4
vim.opt.expandtab = false

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Testing
keymap("n", "<leader>ta", [[:TermExec cmd="go test ./..." exit_on_close=false direction=float size=50<CR>]], opts)
keymap("n", "<leader>tf", [[:TermExec cmd="go test %" exit_on_close=false direction=float size=50<CR>]], opts)
