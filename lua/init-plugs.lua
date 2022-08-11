local packer = require('packer')

return packer.startup(function(use)
    use('wbthomason/packer.nvim')

    -- performance
    use('lewis6991/impatient.nvim')
    use('nathom/filetype.nvim')

    -- use('windwp/nvim-autopairs')

    use('christoomey/vim-tmux-navigator')

    use({ 'tyru/open-browser.vim' }) --
    use({ 'tyru/open-browser-github.vim' }) --

    -- g/
    use('google/vim-searchindex')

    use('kyazdani42/nvim-web-devicons')

    -- navigation
    use('jlanzarotta/bufexplorer') --
    use('kyazdani42/nvim-tree.lua')

    -- gS gJ
    use('AndrewRadev/splitjoin.vim')

    -- telescope
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- theme
    use('navarasu/onedark.nvim')

    use('tpope/vim-commentary') --
    use('tpope/vim-sensible') --
    use('wellle/targets.vim') --

    -- change/edit brackets
    use('tpope/vim-surround') --

    -- git
    use('lewis6991/gitsigns.nvim')
    use('tpope/vim-fugitive') --

    -- status line
    use('nvim-lualine/lualine.nvim')
    use('bercly0b/lualine-lsp-progress')

    -- syntax highligt
    use({ 'wavded/vim-stylus', ft = { 'css', 'scss', 'less', 'sass' } }) --
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    -- lsp
    use('neovim/nvim-lspconfig')
    use('williamboman/nvim-lsp-installer')
    -- linters
    use('jose-elias-alvarez/null-ls.nvim')

    -- autocomplete
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-cmdline')
    use('onsails/lspkind-nvim') -- cmp sources icons

    -- snippets
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
end)
