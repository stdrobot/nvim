-- Mappings
-- Functional wrapper for mapping custom keybindings
local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--[[
vim.cmd([[
map<A-q> :q<kEnter>
map<A-s> :w<kEnter>
map<S-t> :tabnew<CR>
imap <A-s> <Esc>:w<kEnter>i
inoremap {<Enter> {<Enter>}<Esc>O
map <S-?> :!node %<CR>
map <C-]> :x<CR>
nnoremap <C-0> <Cmd>TroubleToggle<cr>
nnoremap <C-x> <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <C-z> <cmd>TroubleToggle document_diagnostics<cr>
]

]]--
if vim.loop.os_uname().sysname == 'Darwin' then
    if vim.fn.getcwd() == '/Users/jonahperry/.scripts/dev' then
        vim.cmd [[ map <C-g> :!g++ -Wall -std=c++2a % -o ../%:r.exe<CR>]]
    else
        vim.cmd [[ map <C-g> :!g++ -Wall -std=c++2a % -o %:r.exe<CR>]]
    end
elseif vim.fn.has('win32') then
    vim.cmd [[ map <C-g> :!g++ -Wall -std=c++20 % -o %:r.exe<CR>]]
end
if vim.loop.os_uname().sysname == 'Darwin' then
    vim.cmd [[ map <C-f> :!./%:r.exe<CR>]]
elseif vim.fn.has('win32') then
    vim.cmd[[ map <C-f> :!%:r.exe<CR>]]
end

map("n", "<C-n>", ":NERDTreeToggle<CR")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<C-l>", ":vsplit<CR>")
map("n", "<C-k>", ":split<CR>")
map("n", "<C-p>", ":!python3 %<CR>")
map("n", "<S-Right>", "<C-w>l <CR>")
map("n", "<S-Left>", "<C-w>h <CR>")
map("n", "<C-0>", "<cmd>TroubleToggle<CR>")
map("v", "++", "<plug>NERDCommenterToggle")

