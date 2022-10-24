local vim = vim
local group = vim.api.nvim_create_augroup
vim.cmd([[
    set number
    set nocompatible
    filetype off
    set clipboard=unnamed "OSX
    set cb=unnamed
    set termguicolors
    set ruler  
    set mouse=a
    set inccommand=nosplit
    set ve+=onemore
    set hidden
    set completeopt-=preview
    set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
    hi LineNr ctermfg=8
    let g:SimpylFold_docstring_preview = 1
    let g:python3_host_prog = '/usr/bin/python'
    set fileencoding=utf-8
    let $LANG='en_US.UTF-8'
    set encoding=utf-8
    luafile ~/.config/nvim/maps.lua
    luafile ~/.config/nvim/plug.lua

    augroup set_colorscheme
        autocmd!
        autocmd Colorscheme * highlight Normal guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight NormalNC guibg=NONE ctermbg=NONE
    augroup end
    colorscheme nordfox
    
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
]])

vim.opt.backup = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.si = true
vim.opt.ai = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
