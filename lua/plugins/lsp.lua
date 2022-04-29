local lsp_installer = require('nvim-lsp-installer')
local cmp_lsp = require('cmp_nvim_lsp')
local utils = require('utils')

local options = {
    tsserver = {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end,

        capabilities = cmp_lsp.update_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        ),

        handlers = {
            ['textDocument/definition'] = function(err, result, method, ...)
                if vim.tbl_islist(result) and #result > 1 then
                    local filtered_result = utils.filter(result, utils.filterReactDTS)
                    return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
                end

                vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
            end
        },
    },

    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    }
}

lsp_installer.on_server_ready(
    function(server)
        local opts = options[server.name] or {}

        server:setup(opts)
    end
)

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

vim.cmd([[
    sign define DiagnosticSignError text= linehl= texthl=DiagnosticSignError numhl=
    sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl=
    sign define DiagnosticSignInfo text= linehl= texthl=DiagnosticSignInfo numhl=
    sign define DiagnosticSignHint text= linehl= texthl=DiagnosticSignHint numhl=
]])
