require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        disable = {},
    },

    indent = {
        enable = false,
        disable = {},
    },

    ensure_installed = {
        'tsx',
        'vim',
        'lua',
        'typescript',
        'javascript',
        'python',
        'jsdoc',
        'json',
        'yaml',
        'html',
        'scss',
        'css',
        'bash',
        'dockerfile',
    },

    -- windwp/nvim-ts-autotag
    autotag = {
        enable = true,
    }
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
