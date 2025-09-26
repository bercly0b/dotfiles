require('lazy-bootstrap')

require("lazy").setup({
    'nathom/filetype.nvim',

    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',

    'christoomey/vim-tmux-navigator',

    'tyru/open-browser.vim',
    'tyru/open-browser-github.vim',

    'kyazdani42/nvim-web-devicons',

    -- navigation
    'jlanzarotta/bufexplorer',
    'kyazdani42/nvim-tree.lua',

    -- gS gJ
    'AndrewRadev/splitjoin.vim',

    -- telescope
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- theme
    -- 'catppuccin/nvim',
    'navarasu/onedark.nvim',

    'tpope/vim-commentary',
    'tpope/vim-sensible',
    'wellle/targets.vim',

    -- change/edit brackets
    'tpope/vim-surround',

    -- git
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

    -- command line popup
    { 'folke/noice.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },

    -- status line
    -- 'rebelot/heirline.nvim',
    'nvim-lualine/lualine.nvim',

    -- syntax highlight
    { 'wavded/vim-stylus', ft = { 'css', 'scss', 'less', 'sass' } },
    'nvim-treesitter/nvim-treesitter',

    -- lsp
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- linters
    'jay-babu/mason-null-ls.nvim',
    'nvimtools/none-ls.nvim',
    'nvimtools/none-ls-extras.nvim',

    -- autocomplete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'onsails/lspkind-nvim',

    -- snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
}, {
    ui = {
        border = "rounded",
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
