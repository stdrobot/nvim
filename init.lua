require("standardrobot.maps")
require("standardrobot.plug")
local name = vim.loop.os_uname().sysname

if name == "Darwin" then
    require("standardrobot.osx")
elseif name == "Windows" then
    require("standardrobot.windows")
end
