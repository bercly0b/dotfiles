local null_ls = require('null-ls')
local command_resolver = require('null-ls.helpers.command_resolver')

local is_pnp = vim.fn.findfile('.pnp.js', '.')
local eslint_diagnostics = null_ls.builtins.diagnostics.eslint_d
local eslint_formatting = null_ls.builtins.formatting.eslint_d

if (is_pnp) then
    eslint_diagnostics = null_ls.builtins.diagnostics.eslint.with({
        dynamic_command = command_resolver.from_yarn_pnp()
    })
    eslint_formatting = null_ls.builtins.formatting.eslint.with({
        dynamic_command = command_resolver.from_yarn_pnp()
    })
end

null_ls.setup({
    sources = {
        eslint_diagnostics,
        eslint_formatting,

        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.formatting.stylelint,

        null_ls.builtins.diagnostics.flake8,
    },
})
