local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Plugins here
    use "wbthomason/packer.nvim"            -- Have packer manage itself
    use "nvim-lua/popup.nvim"               -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"             -- Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs"             -- Auto-closes parens, brackets, quotes etc
    use "numToStr/Comment.nvim"             -- commenting lines and blocks
    use { "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
    use "akinsho/toggleterm.nvim"
    use "moll/vim-bbye"                     -- Close buffers w/o closing windows (adds :Bdelete and :Bwipeout)
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use { 'folke/which-key.nvim', config = function()
        require("which-key").setup {
            presets = {
                operators = true,
                motions = true,
                g = true,
            },
        }
    end }

    -- Navigation
    use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }

    -- Color schemes
    use "lunarvim/darkplus.nvim"

    -- Code completion
    use "hrsh7th/cmp-buffer"                -- buffer completions
    use "hrsh7th/cmp-path"                  -- path completions
    use "hrsh7th/cmp-cmdline"               -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"              -- LSP source
    use "hrsh7th/cmp-nvim-lua"              -- NVIM Lua configuration
    use "saadparwaiz1/cmp_luasnip"          -- snippet completions
    use "hrsh7th/nvim-cmp"                  -- completion plugin

    -- snippets
    use "L3MON4D3/LuaSnip"                  -- snippet engine
    use "rafamadriz/friendly-snippets"      -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"             -- enable LSP
    use "williamboman/mason.nvim"           -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim"   -- LSP diagnostics and code actions
    use "jayp0521/mason-null-ls.nvim"       -- simple to use null ls components installer
    use "lukas-reineke/lsp-format.nvim"     -- async LSP-based formating
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                -- your configuration
            })
        end,
    })

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter - code highlighting
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    -- use "p00f/nvim-ts-rainbow"              -- highlight brackets with rainbow colors

    -- Git
    use "lewis6991/gitsigns.nvim"  

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
