local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/self/dotfiles/.vim/plugged')

Plug('dense-analysis/ale')
Plug('windwp/nvim-autopairs')

Plug('christoomey/vim-tmux-navigator')

Plug('tyru/open-browser.vim')
Plug('tyru/open-browser-github.vim')

-- g/
Plug('google/vim-searchindex')

Plug('kyazdani42/nvim-web-devicons')

-- navigation
Plug('jlanzarotta/bufexplorer')
Plug('kyazdani42/nvim-tree.lua')

-- gS gJ
Plug('AndrewRadev/splitjoin.vim')

-- telescope
Plug('nvim-lua/popup.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

Plug('wellle/targets.vim')

-- theme
Plug('navarasu/onedark.nvim')

Plug('tpope/vim-commentary')
Plug('tpope/vim-sensible')
-- change/edit brackets
Plug('tpope/vim-surround')

-- git
Plug('airblade/vim-gitgutter')
Plug('tpope/vim-fugitive')

-- start screen
Plug('mhinz/vim-startify')

-- status line
Plug('nvim-lualine/lualine.nvim')
Plug('bercly0b/lualine-lsp-progress')

-- syntax highligt
Plug('wavded/vim-stylus')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'} )

-- lsp
Plug('neovim/nvim-lspconfig')
Plug('williamboman/nvim-lsp-installer')

-- autocomplete
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-cmdline')

Plug('onsails/lspkind-nvim') -- cmp sources icons

Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')

vim.call('plug#end')

require('settings')
require('theme')
require('keymaps')

require('plugins/ale')
require('plugins/cmp')
require('plugins/luasnip')
require('plugins/lsp')
require('plugins/tree')
require('plugins/telescope')
require('plugins/lualine')
require('plugins/treesitter')
