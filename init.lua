if vim.loop.os_uname().sysname == 'Darwin' then
    require("standardrobot.osx")
elseif vim.fn.has('win32') then
    require("standardrobot.windows")
end
