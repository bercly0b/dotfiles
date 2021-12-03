set shell=/bin/bash
call plug#begin('~/self/dotfiles/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'lambdalisue/fern.vim'

Plug 'AndrewRadev/splitjoin.vim'

"search by files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'wellle/targets.vim'

" theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

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

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'

call plug#end()

source ~/self/dotfiles/vim/settings.vim
source ~/self/dotfiles/vim/keymaps.vim

source ~/self/dotfiles/vim/plugins/ale.vim
source ~/self/dotfiles/vim/plugins/cmp.vim
source ~/self/dotfiles/vim/plugins/fern.vim
source ~/self/dotfiles/vim/plugins/fzf.vim
source ~/self/dotfiles/vim/plugins/lightline.vim
