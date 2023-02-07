local status, ferntree = pcall(require, "fern")
if not status then
    return
end
local vim = vim

vim.cmd([[
let g:fern#renderer="nerdfont"

]])
