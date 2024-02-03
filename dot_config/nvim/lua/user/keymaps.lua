local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local has_miniclue, miniclue = pcall(require, "mini.clue")

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

-- Navigating through visible lines in soft wrap
vim.cmd [[ nnoremap <expr> k (v:count == 0 ? 'gk' : 'k') ]]
vim.cmd [[ nnoremap <expr> j (v:count == 0 ? 'gj' : 'j') ]]

-- jk in insert mode == ESC
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<leader>ww", ":w<CR>", opts)

-- Centering on navigation and search
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Navigating windows
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Keep yank in the buffer
keymap("v", "p", '"_dP', opts)

-- Removing highlighting on F3
keymap("n", "<f3>", ":noh<cr>", opts)

-- Buffer Bye
keymap("n", "<leader>qq", ":Bdelete<cr>", opts)
keymap("n", "<leader>qo", ":BufferLineCloseOthers<cr>", opts)

if has_miniclue then
    miniclue.set_mapping_desc('n', '<leader>qq', 'Delete buffer')
    miniclue.set_mapping_desc('n', '<leader>qo', 'Delete other buffers')
end

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Neo Tree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ee", ":Neotree toggle<CR>", opts)
keymap("n", "<leader>eb", ":Neotree buffers<CR>", opts)
keymap("n", "<leader>ef", ":Neotree reveal_file=%<CR>", opts)
keymap("n", "<leader>eg", ":Neotree float git_status<CR>", opts)
if has_miniclue then
    miniclue.set_mapping_desc('n', '<Leader>ee', 'Neotree toggle')
    miniclue.set_mapping_desc('n', '<Leader>eb', 'Neotree buffers')
    miniclue.set_mapping_desc('n', '<Leader>ef', 'Neotree reveal file')
    miniclue.set_mapping_desc('n', '<Leader>eg', 'Neotree git status')
end

-- Toggleterm
keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", opts)
keymap("n", "<leader>tm", "<cmd>lua _neomutt_toggle()<CR>", opts)

if has_miniclue then
    miniclue.set_mapping_desc('n', '<Space>tg', 'lazygit')
    miniclue.set_mapping_desc('n', '<Leader>tm', 'neomutt')
end


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
