local null_ls = require('null-ls')
local mason_null_ls = require('mason-null-ls')

mason_null_ls.setup({
    ensure_installed = { 'eslint_d', 'ruff' }
})

null_ls.setup({
    sources = {
        require('none-ls.diagnostics.eslint_d'),
        require('none-ls.formatting.eslint_d'),

        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.formatting.stylelint,

        require('none-ls.diagnostics.ruff'),
        require('none-ls.formatting.ruff'),
    },
})
