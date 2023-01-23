vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 4
vim.opt.expandtab = true

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>ta", [[:TermExec cmd="pytest" exit_on_close=false direction=float size=50<CR>]], opts)
keymap("n", "<leader>tf", [[:TermExec cmd="pytest %" exit_on_close=false direction=float size=50<CR>]], opts)
