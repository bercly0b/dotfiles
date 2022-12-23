local conditions = require('heirline.conditions')

local LSPActive = {
    condition = conditions.lsp_attached,
    update = { 'LspAttach', 'LspDetach' },

    provider  = function()
        local names = {}
        for _, server in pairs(vim.lsp.buf_get_clients(0)) do
            table.insert(names, server.name)
        end
        return '[' .. table.concat(names, ' ') .. ']'
    end,
    hl = { fg = 'fg4' },
}

return LSPActive
