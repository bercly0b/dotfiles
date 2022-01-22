set shell=/bin/bash
call plug#begin('~/self/dotfiles/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" g/
Plug 'google/vim-searchindex'

Plug 'kyazdani42/nvim-web-devicons'
" navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'kyazdani42/nvim-tree.lua'

" gS gJ
Plug 'AndrewRadev/splitjoin.vim'

"search by files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'wellle/targets.vim'

" theme
Plug 'navarasu/onedark.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
" change/edit brackets
Plug 'tpope/vim-surround'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" start screen
Plug 'mhinz/vim-startify'

" status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'

" syntax highligt
Plug 'wavded/vim-stylus'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

lua <<EOF
    require('settings')
    require('theme')
    require('keymaps')

    require('plugins/ale')
    require('plugins/cmp')
    require('plugins/lsp')
    require('plugins/tree')
    require('plugins/fzf')
    require('plugins/lualine')
    require('plugins/treesitter')
EOF
