-- Useful when debugging
if vim.g.nightfox_debug then
  require("nightfox.util.reload")()
end

local palettes = {
    nordfox = {
        comment = "#ffffff"
    }
}

local specs = {
    all = {
        syntax = {
            variable = "red.bright",
        }
    }
}

require("nightfox").setup({ palettes = palettes }, {specs = specs})
vim.cmd.colorscheme "nordfox"
