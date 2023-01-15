local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- n - normal
-- i - insert
-- v - visual
-- x - block mode
-- t - term
-- c - command

-- Resize with arrows (not mac?!)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- jk in insert mode == ESC
keymap("i", "jk", "<ESC>", opts)

-- Centering on navigation and search
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Keep yank in the buffer
keymap("v", "p", '"_dP', opts)

-- Removing highlighting on F3
keymap("n", "<f3>", ":noh<cr>", opts)

-- Buffer Bye
keymap("n", "<leader>q", ":Bdelete<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Toggleterm
keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", opts)
keymap("n", "<leader>tf", [[:TermExec cmd="make test" exit_on_close=false direction=float size=50<CR>]], opts)

-- Bufferline
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)

-- Format code
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

--- Gitsigns
local ok, _ = pcall(require, "gitsigns")
if ok then
    -- Hunks
    keymap("n", "<leader>ihp", "<cmd>lua require('gitsigns').preview_hunk_inline()<CR>", opts)
    keymap("n", "<leader>ihr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", opts)
    keymap("n", "<leader>ib", ":Gitsigns blame_line<cr>", opts)
end
