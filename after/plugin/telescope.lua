-- Functional wrapper for mapping custom keybindings
local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", ";f", "<Cmd>Telescope find_files<CR>", { silent=true })
map("n", ";r", "<cmd>Telescope live_grep<CR>", {silent=true})
map("n", ";;", "<cmd>Telescope help_tags<CR>", {silent=true})
map("n", ";b", "<cmd>Telescope buffers<CR>", {silent=true})

local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["Esc"] = actions.close
            }
        }
    }
}

