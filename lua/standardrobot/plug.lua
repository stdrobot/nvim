return require("packer").startup({
    function(use)
        use("EdenEast/nightfox.nvim")
        use("morhetz/gruvbox")
        use("goolord/alpha-nvim")
        use("arcticicestudio/nord")
        use("sam4llis/nvim-tundra")
        use("justinhj/battery.nvim")
        -- LSP + bells n whistles  autocomplete, autopairs, etc.
        use("neovim/nvim-lspconfig")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/nvim-cmp")
        use("windwp/nvim-autopairs")
        use("windwp/nvim-ts-autotag")

        use("anuvyklack/pretty-fold.nvim")
        use("anuvyklack/fold-preview.nvim")
        use("anuvyklack/keymap-amend.nvim")
        use("folke/trouble.nvim")

        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        })
        use("nvim-treesitter/playground")
        use("nvim-lua/popup.nvim")
        use("nvim-lua/plenary.nvim")
        use("nvim-telescope/telescope.nvim")
        use("preservim/nerdtree")
        use("nvim-lualine/lualine.nvim")
        use("kyazdani42/nvim-web-devicons")
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")
        use({ "glepnir/lspsaga.nvim", branch = "main" })
        use("mfussenegger/nvim-jdtls")
        use("tpope/vim-surround")
        use("onsails/lspkind.nvim")

        use("MunifTanjim/prettier.nvim")
        use("jose-elias-alvarez/null-ls.nvim")
    end,
    config = {
        compile_path = "./after/plugin/packer_compiled.lua",
    },
})
