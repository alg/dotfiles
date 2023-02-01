return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.g.neo_tree_remove_legacy_commands = 1

        require('neo-tree').setup {
            window = {
                mappings = {
                    ['<bs>'] = 'close_node',
                    ['<leader>e'] = 'close_window',
                },
            },
        }
    end
}
