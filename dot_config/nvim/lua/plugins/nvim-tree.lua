-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

return {
    "kyazdani42/nvim-tree.lua",

    dependencies = { "kyazdani42/nvim-web-devicons" },

    config = {
        disable_netrw = true,
        hijack_netrw = true,

        -- diagnostics = {
        --     enable = true,
        -- },

        sort_by = "case_sensitive",

        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                },
            },
        },

        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },

        renderer = {
            group_empty = true,
        },

        filters = {
            dotfiles = false,
        },

        update_focused_file = {
            enable = disable,
        },

        git = {
            enable = true,
            ignore = true,
            timeout = 500,
        },
    }
}
