-- Terminal
return {
    "akinsho/toggleterm.nvim",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup {
            size = 20,
            open_mapping = [[<c-`>]],
        }

        function _G.set_terminal_keymaps()
            local opts = { noremap = true }
            -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', '<C-`><C-n>', opts)
            -- vim.api.nvim_buf_set_keymap(0, 't', 'jk',    '<C-`><C-n>', opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        -- custom terminals --
        local Terminal  = require('toggleterm.terminal').Terminal

        -- lazygit
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
        function _lazygit_toggle()
          lazygit:toggle()
        end

        -- neomutt
        local neomutt = Terminal:new({ cmd = "neomutt", hidden = true, direction = "float" })
        function _neomutt_toggle()
          neomutt:toggle()
        end
    end
}
