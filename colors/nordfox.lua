-- Useful when debugging
if vim.g.nightfox_debug then
  require("nightfox.util.reload")()
end

local palettes = {
    nordfox = {
        comment = "#ffffff"
    }
}

require("nightfox").setup({ palettes = palettes })
vim.cmd.colorscheme "nordfox"
