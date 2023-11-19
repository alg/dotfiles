return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        
        -- for support of "_with_window_picker" suffix in actions
        -- "s1n7ax/nvim-window-picker",
    },

    config = function()
        vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
        vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
        vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
        vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

        require('neo-tree').setup {
            window = {
                mappings = {
                    ['<bs>'] = 'close_node',
                    ['<s-bs>'] = 'navigate_up',
                    ['<leader>e'] = 'close_window',
                    -- ['<cr>'] = 'open_with_window_picker',
                    ['<cr>'] = 'open',
                    -- ['<c-v>'] = 'vsplit_with_window_picker',
                    ['<c-v>'] = 'open_vsplit',
                },
            },

            filesystem = {
                follow_current_file = {
                    enabled = false,
                },
            },

            renderers = {
                directory = {
                    { "indent" },
                    { "icon" },
                    { "current_filter" },
                    {
                        "container",
                        width = "100%",
                        right_padding = 0,
                        content = {
                            { "name", zindex = 10 },
                            { "clipboard", zindex = 10 },
                            { "diagnostics", errors_only = true, zindex = 20, align = "right" },
                        },
                    },
                },
                file = {
                    { "indent" },
                    { "icon" },
                    {
                        "container",
                        width = "100%",
                        right_padding = 0,
                        content = {
                            { "name", zindex = 10 },
                            { "clipboard", zindex = 10 },
                            { "bufnr", zindex = 10 },
                            { "modified", zindex = 20, align = "right" },
                            { "diagnostics",  zindex = 20, align = "right" },
                            { "git_status", zindex = 20, align = "right" },
                        },
                    },
                },
            },
        }
    end
}
