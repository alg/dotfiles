return {
	"chrisgrieser/nvim-scissors",
	dependencies = "nvim-telescope/telescope.nvim", -- optional
	opts = {
		snippetDir = "~/.config/nvim/snippets",
	},

    config = function()
        vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)
        vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)

        local has_miniclue, miniclue = pcall(require, "mini.clue")
        if has_miniclue then
            miniclue.set_mapping_desc('n', '<Leader>se', 'Edit snippet')
            miniclue.set_mapping_desc('n', '<Leader>sa', 'Add snippet')
        end
    end
}

