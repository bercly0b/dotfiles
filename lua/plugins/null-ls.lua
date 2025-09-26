local null_ls = require('null-ls')
local mason_null_ls = require('mason-null-ls')

local eslint_diagnostics = require('none-ls.diagnostics.eslint_d')
local eslint_formatting = require('none-ls.formatting.eslint_d')

mason_null_ls.setup({
    ensure_installed = { 'eslint_d', 'ruff', 'black' }
})

null_ls.setup({
    sources = {
        eslint_diagnostics,
        eslint_formatting,

        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.formatting.stylelint,

        -- require('none-ls-extras.nvim.diagnostics.ruff'),
        -- null_ls.builtins.formatting.black.with({
        --     prefer_local = 'python_venv/bin',
        -- }),
    },
})
