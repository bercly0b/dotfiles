" split window resize
nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -10"<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <leader>n :noh<CR>

" Bufexplorer
nnoremap <leader>o :BufExplorer<CR>

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" add new line in normal mode
nmap <S-CR> O<Esc>j
nmap <CR> o<Esc>k

" copy/paste snippet
vnoremap <c-c> "*y
vnoremap <c-c> "*y
nnoremap <c-v> "*p
nnoremap <c-v> "*p

" json prettify
com! JSONprettify %!python -m json.tool

nmap <silent> <C-g>h :OpenGithubFile<CR>

imap jj <Esc>

" ale
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
nnoremap <silent> <leader>t :ALEToggle<CR>
nnoremap <silent> <leader>s :ALEFix<CR>

" tree
nnoremap <leader><leader> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>/ :NvimTreeFindFile<CR>

" fzf
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>f :Files<CR>

" lsp
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> L <cmd>lua vim.diagnostic.open_float()<CR>

nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
