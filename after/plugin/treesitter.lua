local status, npairs = pcall(require, "nvim-autopairs")
local treesitter_conf = require("nvim-treesitter.configs")
if not status then
    return
end

require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "lua",
        "rust",
        "cpp",
        "fish",
        "html",
        "vim",
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
        additional_vim_regex_highlighting = true,
    },
    autotag = {
        enable = true,
    },
    --
})
