local lspconfig = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')
local cmp_lsp = require('cmp_nvim_lsp')
local utils = require('utils.filter-definition')

local capabilities = cmp_lsp.default_capabilities()

local servers = { 'tsserver', 'sumneko_lua', 'pyright' }
local options = {
    tsserver = {
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

    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    },
}

lsp_installer.setup({ ensure_installed = servers })

for _, name in pairs(servers) do
    local opts = options[name] or {}
    lspconfig[name].setup(opts)
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
