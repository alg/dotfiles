vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 4
vim.opt.expandtab = false

-- Keybindings
vim.keymap.set("n", "<leader>ta", [[:TermExec cmd="go test ./..." exit_on_close=false direction=float size=50<CR>]], { noremap = true, silent = true, buffer = true, desc = 'Run all tests' })
vim.keymap.set("n", "<leader>tf", [[:TermExec cmd="go test %" exit_on_close=false direction=float size=50<CR>]], { noremap = true, silent = true, buffer = true, desc = 'Run tests for this file' })
