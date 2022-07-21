if vim.fn.has("unix") then
    vim.cmd([[
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    luafile ~/.config/nvim/macos.lua
  endif
  ]])
end
if vim.fn.has('win32') then
  require('windows')
end 
