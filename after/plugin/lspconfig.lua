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
                File = '', -- File
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
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    -- TODO: POTENTIAL FILTER TO DISABLE COMPLETION ITEMS BY KIND
    -- implement into the config immediately, haha
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
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

local opts = { noremap=true, silent=true }
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
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

   --  local opts = { noremap=true, silent=true }
    require("nvim-autopairs").setup{}
end
-- END ATTACH
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities(protocol.make_client_capabilities())

local fold_capabilities = vim.lsp.protocol.make_client_capabilities()
fold_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- BEGINS FLAGS
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local set_fallback_flags = function()
    if vim.loop.os_uname().sysname == "Darwin" then
        local fallback_flags = {"--target=arm64-apple-darwin", "-std=c++2a", } 
    elseif vim.fn.has('win32') then
        local fallback_flags = {"--target=x86_x64-w64-windows-gnu", "-std=c++20"}
    end
end

local arguments = {}
if vim.loop.os_uname().sysname == "Darwin" then
    arguments = {"-std=c++2a"} 
elseif vim.fn.has('win32') then
    arguments = {"-std=c++20"}
end

-- END FLAGS

nvimlsp['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
    cmd = { "clangd", "--background-index", "--clang-tidy"},
   -- single_file_support = false,
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
    capabilities = cmp_capabilities,
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
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    capabilities = cmp_capabilities,
    flag = lsp_flags,
}

nvimlsp['rust_analyzer'].setup{
   on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
}

nvimlsp['jdtls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
    root_dir = function()
        return vim.fn.getcwd()
    end

}

nvimlsp['sumneko_lua'].setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


nvimlsp['gopls'].setup({})

cmp_capabilities.textDocument.completion.snippetSupport = true

nvimlsp['html'].setup{
    capabilities = cmp_capabilities,
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    init_options = {
        provideFormatter = false,
    }
}

nvimlsp['phpactor'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
}
