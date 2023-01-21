-- Displays buffer navigation line

return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = {
        options = {
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        },
    }
}
