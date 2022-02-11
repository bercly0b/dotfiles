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
        'jsdoc',
        'json',
        'yaml',
        'html',
        'scss',
        'css',
        'bash',
        'dockerfile',
    },
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
