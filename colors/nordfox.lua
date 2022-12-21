local status, nightfox = pcall(require, "nightfox")
if not status then
    return
end

local palettes = {
    nordfox = {
        comment = "#828fa1",
    },
    -- Custom duskfox with black background
}
local specs = {
    nordfox = {
        syntax = {
            variable = "",
        },
    },
}
nightfox.setup({ palettes = palettes, specs = specs })

vim.cmd.colorscheme("nordfox")
