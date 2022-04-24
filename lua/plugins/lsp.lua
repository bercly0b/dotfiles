local lsp_installer = require('nvim-lsp-installer')
local lsp_config = require('lspconfig')
local cmp_lsp = require('cmp_nvim_lsp')

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
end)

lsp_config.tsserver.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,

    capabilities = cmp_lsp.update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    ),
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
