-- Displays buffer navigation line

return {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = {
        options = {
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        },
    }
}
