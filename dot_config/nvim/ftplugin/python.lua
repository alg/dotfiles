vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 4
vim.opt.expandtab = true

-- Keybindings
vim.keymap.set("n", "<leader>ta", [[:TermExec cmd="pytest" exit_on_close=false direction=float size=50<CR>]], { noremap = true, silent = true, buffer = true, desc = 'Run all tests' })
vim.keymap.set("n", "<leader>tf", [[:TermExec cmd="pytest %" exit_on_close=false direction=float size=50<CR>]], { noremap = true, silent = true, buffer = true, desc = 'Run tests in this file' })
