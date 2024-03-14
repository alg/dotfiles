return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		require("silicon").setup({
            font = "JetBrainsMono Nerd Font=34",
            background = "#ffffff",
            theme = "Nord",
            to_clipboard = true,

            pad_horiz = 48,
            pad_vert = 48,
		})
	end
}
