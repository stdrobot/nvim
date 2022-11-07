-- Functional wrapper for mapping custom keybindings
local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", ";f", "<cmd>lua require('telescope.builtin').find_files({find_commands='rg'})<CR>", { silent = true })
map("n", ";r", "<cmd>lua require('telescope.builtin').live_grep({find_commands='rg'})<CR>", { silent = true })
map("n", ";;", "<cmd>lua require('telescope.builtin').help_tags()<CR>", { silent = true })
map("n", ";b", "<cmd>lua require('telescope.builtin').buffers()<CR>", { silent = true })
map("n", ";o", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", { silent = true })
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["Esc"] = actions.close,
            },
        },
    },
})
