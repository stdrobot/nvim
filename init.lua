if vim.loop.os_uname().sysname == 'Darwin' then
	vim.cmd([[ luafile ~/.config/nvim/osx.lua]])
elseif vim.fn.has('win32') then
    vim.cmd([[ luafile ~/.config/nvim/windows.lua]])
end

vim.cmd([[
]])
