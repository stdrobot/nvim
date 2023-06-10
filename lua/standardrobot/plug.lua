local vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({

    "EdenEast/nightfox.nvim",
    "morhetz/gruvbox",
    { "catppuccin/nvim", name = "catppuccin" },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local screen = require("screen")
            return screen
        end,
    },

    -- THEMES
    "arcticicestudio/nord",
    "justinhj/battery.nvim",
    "rebelot/kanagawa.nvim",

    -- LSP + bells n whistles  autocomplete, autopairs, etc.
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "anuvyklack/pretty-fold.nvim",
    "anuvyklack/fold-preview.nvim",
    "anuvyklack/keymap-amend.nvim",
    "folke/trouble.nvim",
    "dstein64/vim-startuptime",

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lualine/lualine.nvim",
    "kyazdani42/nvim-web-devicons",
    -- "nvim-tree/nvim-web-devicons",
    "L3MON4D3/LuaSnip",
    "Vimjas/vim-python-pep8-indent",
    "saadparwaiz1/cmp_luasnip",
    "windwp/nvim-autopairs",
    { "glepnir/lspsaga.nvim", branch = "main" },
    "mfussenegger/nvim-jdtls",
    "tpope/vim-surround",
    "onsails/lspkind.nvim",
    "MunifTanjim/prettier.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "nvim-tree/nvim-tree.lua",
})
