require("standardrobot.maps")
require("standardrobot.plug")
local vim = vim
local group = vim.api.nvim_create_augroup
local highlight = vim.api.nvim_set_hl

local nightfox = require("nightfox")
local catp = require("catppuccin")

local name = vim.loop.os_uname().sysname

if name == "Windows_NT" then
    -- INIT CONFIG; WINDOWS
    vim.cmd([[let g:python3_host_prog = 'C:/Users/jonah/AppData/Local/Programs/Python/Python311/python']])
elseif name == "Darwin" then
    vim.cmd([[let g:python3_host_prog = '/usr/bin/python']])
end
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.smarttab = true
--vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
vim.opt.encoding = "utf-8"
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"
vim.opt.cb = "unnamed"
vim.opt.syntax = "on"
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.inccommand = "nosplit"
vim.opt.hidden = true
vim.opt.ruler = true
vim.opt.virtualedit = vim.opt.virtualedit + "onemore"
vim.opt.completeopt = vim.opt.completeopt - "preview"
vim.opt.title = true
vim.wo.number = true
vim.g.nocompatible = 1
vim.opt.backup = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.si = true
vim.opt.ai = true
vim.opt.pumheight = 30
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
highlight(0, "DiagnosticsVirtualTextError", { bg = "#ff0000" })
vim.g.mapleader = " "
-- local original_color = "#2E313A"
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[

    set modifiable
    set nofixeol
    highlight LineNR cterm=none ctermfg=Yellow ctermbg=none
    highlight CursorLineNR cterm=bold ctermfg=Black ctermbg=none

    let &t_ut=''
    let g:SimpylFold_docstring_preview = 1
    set fileencoding=utf-8
    let $LANG='en_US.UTF-8'
    hi LspDiagnosticsVirtualTextWarning guifg=orange gui=bold,italic,underline
    hi LspDiagnosticsVirtualTextInformation guifg=yellow gui=bold,italic,underline
    hi LspDiagnosticsVirtualTextHint guifg=green gui=bold,italic,underline

    augroup set_fold_specs
        autocmd!
        autocmd VimEnter * set foldlevel=99
        autocmd VimEnter * set foldcolumn=0
        autocmd VimEnter * set foldmethod=expr
        autocmd VimEnter * set foldexpr=nvim_treesitter#foldexpr()
    augroup END

    augroup remember_folds
      autocmd!
      autocmd BufWinLeave *.* mkview
      autocmd BufWinEnter *.* silent! loadview
    augroup END

]])

vim.api.nvim_create_augroup("nobg", { clear = true })
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    desc = "Make all backgrounds transparent",
    group = "nobg",
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
        -- etc...
    end,
})
--

local palettes = {
    nordfox = {
        comment = "#828fa1",
    },
    -- Custom duskfox with black background
}

local specs = {
    nordfox = {
        syntax = {
            variable = "#ededd5",
            builtin0 = "#67b2a0",
            -- builtin1 = "#93ccdc",
            builtin1 = "#a4cfdb",
            builtin2 = "#d89079",
            builtin3 = "#d06f79",
            conditional = "#c895bf",
            type = "#ebcb8b",
        },
    },
}

catp.setup({
    flavour = "mocha",
    color_overrides = {
        all = {
            overlay0 = "#99a4b2",
        },
    },
})
nightfox.setup({ palettes = palettes, specs = specs })
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("nordfox")
