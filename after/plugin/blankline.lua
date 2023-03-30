local status, blankline = pcall(require, "indent_blankline")
if not status then
    return
end
vim.opt.list = true

blankline.setup({
    use_treesitter = false,
    show_trailing_blankline_indent = false,
    filetype_exclude = {
        "help",
        "terminal",
        "markdown",
        "dashboard",
        "packer",

        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
    },
})

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.cmd([[
    highlight IndentBlanklineChar guifg=#3b4752 gui=nocombine 
    highlight IndentBlanklineSpaceChar guifg=#3b4752 gui=nocombine
]])
