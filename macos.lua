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

luafile ~/.config/nvim/maps.lua
luafile ~/.config/nvim/plug.lua
colorscheme gruvbox
]])

