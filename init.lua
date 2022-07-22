if vim.fn.has('macunix') then
    vim.cmd [[ luafile ~/.config/nvim/macos.lua]]
end
if vim.fn.has('win32') then
    vim.cmd[[ luafile ~/.config/nvim/windows.lua]]
end
