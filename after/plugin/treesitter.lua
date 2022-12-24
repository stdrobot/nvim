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
        "vim",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "python",
    },
    indent = { enable = true, disable = { "python" } },

    sync_install = false,
    -- indent = { enable = true, disable_filetype },
    matchup = { enable = true },
    playground = { enable = true },
    highlight = {
        enable = vim.g.vscode ~= 1,
        additional_vim_regex_highlighting = true,
    },
    autotag = {
        enable = true,
    },
    --
})
