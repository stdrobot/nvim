local status, blankline = pcall(require, "indent_blankline")
if not status then
    return
end

blankline.setup({
    use_treesitter = false,
    show_trailing_blankline_indent = false,

    filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
    },
})
