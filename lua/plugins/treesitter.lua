require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        disable = {},
    },

    indent = {
        enable = false,
        disable = {},
    },

    auto_install = true,

    -- windwp/nvim-ts-autotag
    autotag = {
        enable = true,
    }
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
