vim.cmd([[
set number
set nocompatible
filetype off
set clipboard=unnamed
set ruler
set mouse=a
set hidden
set completeopt-=preview
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
hi LineNr ctermfg=8
let g:python3_host_prog = '/usr/bin/python'

source ~/.config/nvim/maps.vim
luafile ~/.config/nvim/plug.lua

highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
colorscheme gruvbox
]])
