return {
    "L3MON4D3/LuaSnip",                  -- snippet engine
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        -- Load friendly-snippets
        require("luasnip/loaders/from_vscode").lazy_load()

        -- Load custom snippets
        require("luasnip/loaders/from_vscode").lazy_load({
            paths = "./snippets",
        })
    end,
}
