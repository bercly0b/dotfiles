set shell=/bin/bash
call plug#begin('~/self/dotfiles/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'yegappan/mru'
Plug 'preservim/nerdtree'

Plug 'AndrewRadev/splitjoin.vim'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
"search by files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"search by content
Plug 'mileszs/ack.vim'

Plug 'wellle/targets.vim'

" theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
" change/edit brackets
Plug 'tpope/vim-surround'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" start screen
Plug 'mhinz/vim-startify'

" airline
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" syntax highligt
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars'
Plug 'alexlafroscia/postcss-syntax.vim' "check
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'vim-python/python-syntax'

call plug#end()

let mapleader = " "
set number
set relativenumber
syntax enable
set guifont=RobotoMono\ Nerd\ Font:h14
filetype plugin indent on
set guicursor+=a:blinkon0
set scrolloff=1
set mouse=a

set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" GUI options
set guioptions-=r
set guioptions-=L

" lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }

augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

" Theme
" colorscheme onedark
"
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_light='soft'
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
colorscheme gruvbox
" colorscheme dracula

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:vim_jsx_pretty_colorful_config = 1

" Buffer movement
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" split window resize
nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Set to auto read when a file is changed from the outside
set autoread
" Ignore case when searching
set ignorecase
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=4

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" No annoying sound on errors
set noerrorbells
set novisualbell
set visualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
en
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

set wildignore+=*/node_modules/*,/\.git/*

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>n :noh<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

let g:python_highlight_all = 1

""""PLUGINS""""
""""""""""""""""

" NerdTree
nnoremap <leader><leader> :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>/ :NERDTreeFind<cr>
let g:NERDTreeWinPos = "left"
let NERDTreeStatusline='%{exists("b:NERDTree")?fnamemodify(b:NERDTree.root.path.str(), ":~"):""}'

" Indent guides
let g:indent_guides_enable_on_vim_startup = 0

" MRU
nnoremap <leader>p :MRU<cr>

" Ale
let g:js_linters = ['eslint', 'tsserver']
let g:ts_linters = ['eslint', 'tsserver', 'tslint']
let g:ale_linters = {
    \ "javascript": js_linters,
    \ "typescript": ts_linters,
    \ }
let g:js_fixers = ['eslint']
let g:ts_fixers = ['eslint', 'tslint']
let g:ale_fixers = {
    \ "*": ['remove_trailing_lines', 'trim_whitespace'],
    \ "javascript": js_fixers,
    \ "typescript": ts_fixers,
    \ }
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = "never"

let g:ale_typescript_tslint_use_global = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

nnoremap <silent> <leader>b :ALENext<CR>
nnoremap <silent> <leader>bp :ALEPrevious<CR>
nnoremap <silent> <leader>t :ALEToggle<CR>
nnoremap <silent> <leader>s :ALEFix<CR>
"/ Ale

autocmd FileType javascript,javascriptreact,typescript,javascript.jsx,typescript.tsx map <c-]> :ALEGoToDefinition<cr>
autocmd FileType typescriptreact set ft=typescript

autocmd Filetype * if getfsize(@%) > 500000 | set ft=none | endif

" Bufexplorer
nnoremap <leader>o :BufExplorer<CR>

" fzf
nnoremap <Leader>f :Files<CR>
" nnoremap <leader>c :call fzf#run({'sink': 'e', 'window': 'rightbelow 20new'})<CR>

let g:fzf_layout = { 'window': 'rightbelow 20new' }
let g:fzf_preview_window = []
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Conditional'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" /fzf

" Sleeper
let g:sleeper_point = '<++>'
function! JumpToPrevSleeperPoint()
    let @/ = g:sleeper_point
    normal! N<CR>
endfunction

" Prettier
let g:prettier#config#tab_width = 4
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#bracket_spacing = 'true'

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" clear search on enter insert mode
autocmd InsertEnter * :let @/=""

" ack
cnoreabbrev Ack Ack!
let g:ackhighlight = 1
let g:ackprg = 'ag --vimgrep'
let g:ack_default_options = ' -s -H --nocolor --nogroup --column --smart-case --follow'
let g:ack_qhandler = 'botright copen 25'

" search with args
" nnoremap <Leader>a :Ack! -i<Space>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <Leader>a :Ag<CR>
" /ack

" add new line in normal mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/.nvm/versions/node/v12.20.0/bin/node'],
    \ 'javascriptreact': ['~/.nvm/versions/node/v12.20.0/bin/node']
    \ }

nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
" nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>

" autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_node_path = '~/.nvm/versions/node/v12.20.0/bin/node'

" remove extra spaces on save file
autocmd BufWritePre * :%s/\s\+$//e

" copy/paste snippet
vnoremap <c-c> "*y
vnoremap <c-c> "*y
nnoremap <c-v> "*p
nnoremap <c-v> "*p

" json prettify
com! JSONprettify %!python -m json.tool

" for postcss highlight
au BufNewFile,BufRead *.pcss setfiletype css

" incsearch-fuzzy.vim
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
