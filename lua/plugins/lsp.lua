local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local utils = require('utils.filter-definition')

local capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = { 'ts_ls', 'lua_ls', 'pyright' }
local options = {
    ts_ls = {
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end,

        capabilities = capabilities,

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

    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    },
}

mason.setup()
mason_lspconfig.setup({ ensure_installed = servers })

for _, name in pairs(servers) do
    local opts = options[name] or {}
    vim.lsp.config(name, opts)
end

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
