set shell=/bin/bash
call plug#begin('~/self/dotfiles/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'yegappan/mru'
Plug 'lambdalisue/fern.vim'

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
Plug 'flowtype/vim-flow'
Plug 'wavded/vim-stylus'

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
" disable colorcolumn
set cc=0

set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" GUI options
set guioptions-=r
set guioptions-=L

let g:node_path = '/home/vladpotapov/.nvm/versions/node/v12.20.0/bin/node'

" lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'linterstatus' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \   'linterstatus': 'LinterStatus'
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }

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

" split window resize
nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Set to auto read when a file is changed from the outside
set autoread
" Ignore case when searching
set smartcase
set ignorecase
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Show matching brackets when text indicator is over them
set showmatch

set inccommand=nosplit
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

" Fern
nnoremap <leader><leader> :Fern . -drawer -width=50 -toggle<cr>
nnoremap <leader>/ :Fern . -drawer -reveal=% -width=50<cr>
let g:fern#disable_default_mappings   = 1
let g:fern#disable_drawer_auto_quit   = 1
let g:fern#disable_viewer_hide_cursor = 1

let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = '  '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '
let g:fern#hide_cursor = 1

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> x <Plug>(fern-action-collapse)
  nmap <buffer> N <Plug>(fern-action-new-file)
  nmap <buffer> K <Plug>(fern-action-new-dir)
  nmap <buffer> D <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> <nowait> I <Plug>(fern-action-hidden:toggle)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> Y <Plug>(fern-action-yank)
  nmap <buffer> o <Plug>(fern-action-system:open)

  nmap <buffer> <nowait> < <Plug>(fern-action-leave)
  nmap <buffer> <nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
" /Fern

" Indent guides
let g:indent_guides_enable_on_vim_startup = 0

" MRU
nnoremap <leader>p :20MRU<cr>

" Ale
let g:js_linters = ['eslint', 'tsserver']
let g:ts_linters = ['eslint', 'tsserver', 'tslint']

let g:ale_linters = {
    \ "javascript": js_linters,
    \ "typescript": ts_linters,
    \ "json": ['jsonlint', 'spectral'],
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

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_typescript_tslint_use_global = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
nnoremap <silent> <leader>t :ALEToggle<CR>
nnoremap <silent> <leader>s :ALEFix<CR>

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'ok' : printf(
        \   '%dW %dE ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
"/ Ale

autocmd FileType javascript,javascriptreact,typescript,javascript.jsx,typescript.tsx map <c-]> :ALEGoToDefinition<cr>
autocmd FileType typescriptreact set ft=typescript.tsx

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
    \ 'javascript': [node_path],
    \ 'javascriptreact': [node_path]
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

let g:coc_node_path = node_path

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

let g:javascript_plugin_flow = 1

nmap <silent> <C-g>h :OpenGithubFile<CR>

" disable relative string numbers on insert mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
