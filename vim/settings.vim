let mapleader = " "
set number
set relativenumber

syntax enable
set guifont=RobotoMono\ Nerd\ Font:h14
filetype plugin indent on
set cc=0

" Ignore case when searching
set smartcase
set ignorecase
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Show matching brackets when text indicator is over them
set showmatch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

set wildignore+=*/node_modules/*,/\.git/*

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" if hidden is not set, TextEdit might fail.
set hidden
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

set t_Co=256

set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:node_path = '~/.nvm/versions/node/v12.20.0/bin/node'

" Theme
colorscheme onedark
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:one_allow_italics = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:vim_jsx_pretty_colorful_config = 1

" Indent guides
let g:indent_guides_enable_on_vim_startup = 0

" remove extra spaces on save file
autocmd BufWritePre * :%s/\s\+$//e

" for postcss highlight
au BufNewFile,BufRead *.pcss setfiletype css

" disable relative string numbers on insert mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

autocmd Filetype * if getfsize(@%) > 500000 | set ft=none | endif
