return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        
        -- for support of "_with_window_picker" suffix in actions
        "s1n7ax/nvim-window-picker",
    },
    config = function()
        vim.g.neo_tree_remove_legacy_commands = 1

        require('neo-tree').setup {
            window = {
                mappings = {
                    ['<bs>'] = 'close_node',
                    ['<leader>e'] = 'close_window',
                    ['<cr>'] = 'open_with_window_picker',
                    ['<c-v>'] = 'vsplit_with_window_picker',
                },
            },
        }
    end
}
