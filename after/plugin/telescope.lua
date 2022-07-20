-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- nnoremap <silent> ;f <Cmd>Telescope find_files<CR>
-- nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
-- nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
-- nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>
map("n", ";f", "<Cmd>Telescope find_files<CR>", { silent=true })

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

