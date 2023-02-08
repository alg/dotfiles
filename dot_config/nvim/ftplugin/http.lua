local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Testing
keymap("n", "<leader>r", "<cmd>lua require('rest-nvim').run()<cr>", opts)
