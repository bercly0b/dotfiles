local lsp_installer = require('nvim-lsp-installer')
local lsp_config = require('lspconfig')

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
end)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_config.tsserver.setup({
    capabilities = capabilities,
})

-- lsp_config.sumneko_lua.setup({
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
