
-- Mappings
vim.cmd([[
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
map <S-Right> <C-w><C-w><CR>
map <S-Left> <C-h><CR>
map <S-l> :vsplit<CR>
map <S-k> :split<CR>
map<A-q> :q<kEnter>
map<A-s> :w<kEnter>
map<S-t> :tabnew<CR>
imap <A-s> <Esc>:w<kEnter>i
inoremap {<Enter> {<Enter>}<Esc>O
map <S-?> :!node %<CR>
map <S-g> :!g++ -Wall -std=c++20 % -o %:r.exe<CR>
map <C-S-p> :!python3 %<CR>
map <C-]> :x<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
]])
if vim.loop.os_uname().sysname == 'Darwin' then
    if vim.fn.getcwd() == '/Users/jonahperry/.scripts' then
        vim.cmd [[ map <S-g> :!g++ -Wall -std=c++2a % -o ../%:r.exe<CR>]]
    else
        vim.cmd [[ map <S-g> :!g++ -Wall -std=c++2a % -o %:r.exe<CR>]]
    end
elseif vim.fn.has('win32') then
    vim.cmd [[ map <S-g> :!g++ -Wall -std=c++20 % -o %:r.exe<CR>]]
end
if vim.loop.os_uname().sysname == 'Darwin' then
    vim.cmd [[ map <S-f> :!./%:r.exe<CR>]]
elseif vim.fn.has('win32') then
    vim.cmd[[ map <S-f> :!%:r.exe<CR>]]
end
