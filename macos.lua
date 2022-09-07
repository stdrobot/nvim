vim.cmd([[
set foldmethod=manual
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
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
colorscheme nightfox
]])

vim.opt.backup = false
