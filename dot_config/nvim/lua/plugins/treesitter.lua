-- Code highlighting

return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {                -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
                "lua",
                "css",
                "dockerfile",
                "go",
                "gomod",
                "html",
                "javascript",
                "json",
                "make",
                "markdown",
                "markdown_inline",
                "proto",
                "python",
                "ruby",
                "scss",
                "sql",
                "toml",
                "typescript",
                "yaml",
            },
            sync_install = false,               -- install languages synchronously
            ignore_install = { "" },            -- List of parsers to ignore installing

            highlight = {
                enable = true,                  -- false will disable the whole extension
                disable = { "html" },           -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
            },

            indent = {
                enable = true,
                disable = { "yaml" }
            },

            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        }
    end
}
