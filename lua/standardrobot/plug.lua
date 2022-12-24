local vim = vim
local fn = vim.fn
local install_path = "/Users/jonahperry/.local/share/nvim/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAIP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
    use({
        "wbthomason/packer.nvim",
        opt = true,
        config = {
            compile_path = "/Users/jonahperry/.config/nvim/after/plugin/packer_compiled.lua",
        },
    })
    if PACKER_BOOTSTRAIP then
        require("packer").sync()
    end
    use({ "EdenEast/nightfox.nvim" })
    use({ "morhetz/gruvbox" })
    use({ "goolord/alpha-nvim" })
    use({ "arcticicestudio/nord" })
    use({ "sam4llis/nvim-tundra" })
    use({ "justinhj/battery.nvim" })
    -- LSP + bells n whistles  autocomplete, autopairs, etc.
    use({ "neovim/nvim-lspconfig" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/nvim-cmp" })

    use({ "anuvyklack/pretty-fold.nvim" })
    use({ "anuvyklack/fold-preview.nvim" })
    use({ "anuvyklack/keymap-amend.nvim" })
    use({ "folke/trouble.nvim" })
    use({ "nvim-treesitter/nvim-treesitter" })
    use({ "nvim-treesitter/playground" })
    use({ "windwp/nvim-ts-autotag" })
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-lua/plenary.nvim" })
    use({ "nvim-telescope/telescope.nvim" })
    use({ "preservim/nerdtree" })
    use({ "nvim-lualine/lualine.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })

    use({ "saadparwaiz1/cmp_luasnip" })
    use({ "windwp/nvim-autopairs" })
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use({ "mfussenegger/nvim-jdtls" })
    use({ "tpope/vim-surround" })
    use({ "onsails/lspkind.nvim" })
    -- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    use({ "MunifTanjim/prettier.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" })
end)
