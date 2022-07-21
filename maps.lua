
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
map <S-n> :!node %<CR>
map <S-g> :!g++ -std=c++20 % -o %:r.exe<CR>
map <S-f> :!%:r.exe<CR>
map <C-S-p> :!python3 %<CR>
map <C-]> :x<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
]])
