local status, npairs = pcall(require, "nvim-autopairs")
local treesitter_conf = require("nvim-treesitter.configs")
if not status then
    return
end

treesitter_conf.setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "lua",
        "rust",
        "cpp",
        "fish",
        "html",
        "css",
        "javascript",
        "typescript",
        "python",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    autopairs = { enable = true },

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },
    --[[
    autotag = {
        enable = true,
    },
    ]]
    --
})

npairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    check_ts = true,
    treesitter_conf = {
        python = { "string", "comment" },
    },
})
