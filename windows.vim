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
let g:python3_host_prog = 'E:/msys64/mingw64/bin/python.exe'

augroup set_colorscheme
    autocmd!
    autocmd Colorscheme * highlight Normal guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight NormalNC guibg=NONE ctermbg=NONE
augroup end

source ~/.config/nvim/maps.vim
luafile ~/.config/nvim/plug.lua

luafile ~/.config/nvim/after/plugin/lspconfig.lua
colorscheme nordfox
