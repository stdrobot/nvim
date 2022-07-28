local nvimlsp = require'lspconfig'

-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
     enabled = function()
        local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
        if in_prompt then  -- this will disable cmp in the Telescope window (taken from the default config)
          return false
        end
        local context = require("cmp.config.context")
        return not(context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
    end,

    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = function(_, vim_item)
            if vim_item.kind == nil then return nil end
            local icons = {
                Text = '', -- Text
                Method = '', -- Method
                Function = '', -- Function
                Constructor = '', -- Constructor
                Field = '', -- Field
                Variable = '', -- Variable
                Class = '', -- Class
                Interface = 'ﰮ', -- Interface
                Module = '', -- Module
                Property = '', -- Property
                Unit = '', -- Unit
                Value = '', -- Value
                Enum = '', -- Enum
                Keyword = '', -- Keyword
                Snippet = '﬌', -- Snippet
                Color = '', -- Color
                Files = '', -- File
                Reference = '', -- Reference
                Folder = '', -- Folder
                EnuMember = '', -- EnumMember
                Constant = '', -- Constant
                Struct = '', -- Struct
                Event = '', -- Event
                Operator = 'ﬦ', -- Operator
                TypeParameter = '', -- TypeParameter
            }
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            return vim_item
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    -- TODO: POTENTIAL FILTER TO DISABLE COMPLETION ITEMS BY KIND
    -- implement into the config immediately, haha
    sources = cmp.config.sources({
      { 
          name = 'nvim_lsp' 
      },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    }),
})
  -- Setup nvim-cmp.
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local protocol = require'vim.lsp.protocol'

-- BEGIN ATTACH
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    
    local opts = { noremap=true, silent=true }
    require("nvim-autopairs").setup{}
end
-- END ATTACH

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- BEGINS FLAGS
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local fallback_flags = {}
if vim.loop.os_uname().sysname == "Darwin" then
    fallback_flags = {"--target=arm64-apple-darwin", "-std=c++2a"}
elseif vim.fn.has('win32') then
    fallback_flags = {"--target=x86_x64-w64-windows-gnu", "-std=c++20"}
end
-- END FLAGS

nvimlsp['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    cmd = { "clangd", "--background-index" },
    single_file_support = false,
    init_options = {
        fallback_flags = fallback_flags,
    },
    root_dir = function()
        return vim.fn.getcwd()
    end
    
}

nvimlsp['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            },
        },
    },
}

nvimlsp['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    root_dir = function()
        return vim.fn.getcwd()
    end
}

