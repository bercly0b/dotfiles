lua << END
    require('lualine').setup {
        options = { theme = 'auto' },
        sections = {
            lualine_b = {
                'branch', 'diff',
                { 'diagnostics', sources={ 'nvim_lsp', 'ale' } }
            },
        },
    }
END
