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

" coc
nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" fern
nnoremap <leader><leader> :Fern . -drawer -width=50 -toggle<cr>
nnoremap <leader>/ :Fern . -drawer -reveal=% -width=50<cr>

" fzf
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>f :Files<CR>
