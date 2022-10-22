local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')
-- Colorschemes / Graphics
Plug 'EdenEast/nightfox.nvim'
Plug 'morhetz/gruvbox'
Plug 'goolord/alpha-nvim'
Plug 'arcticicestudio/nord'
-- LSP + bells n whistles (autocomplete, autopairs, etc.)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'anuvyklack/pretty-fold.nvim'
Plug 'anuvyklack/fold-preview.nvim'
Plug 'anuvyklack/keymap-amend.nvim'
Plug 'folke/trouble.nvim'
Plug 'tmhedberg/SimpylFold'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'

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
Plug 'tpope/vim-surround'
Plug 'onsails/lspkind.nvim'

Plug 'MunifTanjim/prettier.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
vim.call('plug#end')
