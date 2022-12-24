local status, cmp = pcall(require, "cmp")
if not status then
    return
end
local lspkind = require("lspkind")
local cmp_npairs = require("nvim-autopairs.completion.cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        --[[
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
        ]]
        --
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            maxheight = 20,
            icons = true,
            ellipsis_char = "...",
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<tab>"] = cmp.config.disable,
    }),

    -- TODO: POTENTIAL FILTER TO DISABLE COMPLETION ITEMS BY KIND
    sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 2 },
        { name = "nvim_lua", keyword_length = 2 },
        { name = "luasnip" },
        { name = "treesitter" },
    }),
})
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = "buffer" },
    }),
})

--cmp.event:on("confirm_done", cmp_npairs.on_confirm_done())
