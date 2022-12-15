local vim = vim
local group = vim.api.nvim_create_augroup
local highlight = vim.api.nvim_set_hl

vim.cmd([[
    set cursorline
    set cursorlineopt=number
    highlight LineNR cterm=none ctermfg=Yellow ctermbg=none
    highlight CursorLineNR cterm=bold ctermfg=Black ctermbg=none
    let &t_ut=''
    let g:SimpylFold_docstring_preview = 1
    let g:python3_host_prog = '/usr/bin/python'
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
    autocmd BufReadPost,FileReadPost * normal zR

    augroup set_colorscheme
        autocmd!
        autocmd Colorscheme * highlight Normal guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight NormalNC guibg=NONE ctermbg=NONE
    augroup end
]])

vim.opt.encoding="utf-8"
vim.opt.clipboard="unnamed"
vim.opt.cb="unnamed"
vim.opt.syntax="on"
vim.opt.mouse="a"
vim.opt.termguicolors=true
vim.opt.inccommand="nosplit"
vim.opt.hidden=true
vim.opt.ruler=true
vim.opt.tabstop=4
vim.opt.expandtab=true
vim.opt.virtualedit = vim.opt.virtualedit + "onemore"
vim.opt.completeopt = vim.opt.completeopt - "preview"
vim.opt.shiftwidth=4
vim.opt.title=true
vim.wo.number=true
vim.g.filetype=0
vim.g.nocompatible=1
vim.opt.backup = false
vim.opt.backspace = {'start','eol','indent'}
vim.opt.si = true
vim.opt.ai = true
vim.opt.pumheight = 30
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
highlight(0, 'DiagnosticsVirtualTextError', {bg='#ff0000'})
require("nightfox").setup({
  palettes = {
    nordfox = {
      comment = "#828fa1",

    }
    -- Custom duskfox with black background
    },
})
vim.cmd.colorscheme "nordfox"