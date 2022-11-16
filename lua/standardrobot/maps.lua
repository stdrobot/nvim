-- Mappings
vim.cmd([[
vnoremap < <gv
vnoremap > >gv
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
map <S-Right> <C-w>l <CR>
map <S-Left> <C-w>h <CR>
map <C-l> :vsplit<CR>
map <C-k> :split<CR>
map<A-q> :q<kEnter>
map<A-s> :w<kEnter>
map<S-t> :tabnew<CR>
imap <A-s> <Esc>:w<kEnter>i
inoremap {<Enter> {<Enter>}<Esc>O
map <S-?> :!node %<CR>
map <C-p> :!python3 %<CR>
map <C-]> :x<CR>
nnoremap <C-0> <Cmd>TroubleToggle<cr>
nnoremap <C-x> <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <C-z> <cmd>TroubleToggle document_diagnostics<cr>
]])
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
