require('lualine').setup {
    options = {
        theme = 'auto',
        disabled_filetypes = { 'NvimTree' },
    },
    sections = {
        lualine_b = {
            'branch',
            'diff',
            { 'diagnostics', sources = { 'nvim_diagnostic' } },
        },
        lualine_c = {
            { 'filename', path = 1, shorting_target = 50 },
        },
        lualine_x = {
            {
                'lsp_progress',
                display_components = {
                    { 'title', 'percentage', 'message' },
                    'spinner',
                    'lsp_client_name',
                },
                display_lsp_name_after_initialization = true,
            },
            'encoding',
            { 'filetype', icon_only = false },
            'filesize',
        },
    },
}
