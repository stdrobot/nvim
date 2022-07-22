local newname = vim.loop.os_uname().sysname
if vim.fn.has('unix') then
    if newname == 'Darwin' then
        vim.cmd([[ luafile ~/.config/nvim/macos.lua]])
    end
end
if newname == 'win32' then
    vim.cmd [[ luafile ~/.config/nvim/windows.lua]]
end 
