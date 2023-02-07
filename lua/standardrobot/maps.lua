local vim = vim
-- Mappings
-- Functional wrapper for mapping custom keybindings
vim.g.mapleader = " "
local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

if vim.loop.os_uname().sysname == "Darwin" then
    if vim.fn.getcwd() == "/Users/jonahperry/.scripts/dev" then
        vim.cmd([[ map <C-g> :!g++ -Wall -std=c++2a % -o ../%:r.exe<CR>]])
    else
        vim.cmd([[ map <C-g> :!g++ -Wall -std=c++2a % -o %:r.exe<CR>]])
    end
elseif vim.fn.has("win32") then
    vim.cmd([[ map <C-g> :!g++ -Wall -std=c++20 % -o %:r.exe<CR>]])
end
if vim.loop.os_uname().sysname == "Darwin" then
    vim.cmd([[ map <C-f> :!./%:r.exe<CR>]])
elseif vim.fn.has("win32") then
    vim.cmd([[ map <C-f> :!%:r.exe<CR>]])
end
map("i", "<C-Return>", "<CR><CR><C-o>k<Tab>")
map("n", "<S-t>", "::tabnew<CR>")
map("n", "<leader>m", ":lua vim.diagnostic.open_float()<CR>")
map("n", "<S-?>", ":!node %<CR>")
map("n", "<A-q>", ":q<kEnter>")
map("n", "<C-n>", ":Fern . -drawer<CR>")
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
map("n", "<C-l>", ":vsplit<CR>")
map("n", "<C-k>", ":split<CR>")
map("n", "<C-p>", ":!python3 %<CR>")
map("n", "<S-Right>", "<C-w>l <CR>")
map("n", "<S-Left>", "<C-w>h <CR>")
map("n", "<C-0>", "<cmd>TroubleToggle<CR>", { noremap = true })
