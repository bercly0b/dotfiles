set shell=/bin/bash
call plug#begin('~/self/dotfiles/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

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

" airline
Plug 'nvim-lualine/lualine.nvim'

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

source ~/self/dotfiles/vim/settings.vim
source ~/self/dotfiles/vim/theme.vim
source ~/self/dotfiles/vim/keymaps.vim

source ~/self/dotfiles/vim/plugins/ale.vim
source ~/self/dotfiles/vim/plugins/cmp.vim
source ~/self/dotfiles/vim/plugins/tree.vim
source ~/self/dotfiles/vim/plugins/fzf.vim
source ~/self/dotfiles/vim/plugins/lualine.vim
source ~/self/dotfiles/vim/plugins/treesitter.vim
