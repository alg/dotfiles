local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Testing
keymap("n", "<leader>tf", [[:TermExec cmd="cargo test" exit_on_close=false direction=float size=50<CR>]], opts)

