local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')
-- Colorschemes
Plug 'EdenEast/nightfox.nvim'
Plug 'morhetz/gruvbox'
Plug 'goolord/alpha-nvim'
-- LSP + bells n whistles (autocomplete, autopairs, etc.)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'windwp/nvim-autopairs'

Plug 'anuvyklack/pretty-fold.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug('glepnir/lspsaga.nvim', { branch = 'main' })
Plug 'mfussenegger/nvim-jdtls'
vim.call('plug#end')
