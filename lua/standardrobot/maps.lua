local vim = vim
-- Mappings
-- Functional wrapper for mapping custom keybindings
vim.g.mapleader = " "

local bufnr = vim.api.nvim_get_current_buf()
local bufname = vim.api.nvim_buf_get_name(bufnr)

local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

if vim.loop.os_uname().sysname == "Darwin" then
    if #bufname == 55 then
        map("n", "<C-g>", ":!gcc -Wall -std=gnu2x % -o %:r.exe<CR>")
    else
        map("n", "<C-g>", ":!g++ -Wall -std=c++2a % -o %:r.exe<CR>")
    end
elseif vim.loop.os.uname().sysname == "Windows_NT" then
    if #bufname == 55 then
        map("n", "<C-g>", ":!gcc -Wall -std=gnu2x % -o %:r.exe<CR>")
    else
        map("n", "<C-g>", ":!g++ -Wall -std=c++20 % -o %:r.exe<CR>")
    end
end
if vim.loop.os_uname().sysname == "Darwin" then
    vim.cmd([[ map <C-f> :!./%:r.exe<CR>]])

    map("n", "<C-p>", ":!python3 %<CR>")
elseif vim.fn.has("win32") then
    vim.cmd([[ map <C-f> :!%:r.exe<CR>]])
    map("n", "<C-p>", ":!python %<CR>")
end
map("i", "<C-Return>", "<CR><CR><C-o>k<Tab>")
map("n", "<S-t>", "::tabnew<CR>")
map("n", "<leader>m", ":lua vim.diagnostic.open_float()<CR>")
map("n", "<S-?>", ":!node %<CR>")
map("n", "<A-q>", ":q<kEnter>")
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
map("n", "<C-l>", ":vsplit<CR>")
map("n", "<C-k>", ":split<CR>")
map("n", "<S-Right>", "<C-w>l <CR>")
map("n", "<C-n>", ":NvimTreeToggle<kEnter>")
map("n", "<S-Left>", "<C-w>h <CR>")
map("n", "<C-0>", "<cmd>TroubleToggle<CR>", { noremap = true })
map("n", "gp", "`[v`]")
