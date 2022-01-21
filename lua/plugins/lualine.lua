local function getActiveLsp()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()

    if next(clients) == nil then
        return msg
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end

    return msg
end

require('lualine').setup {
    options = {
        theme = 'auto',
        disabled_filetypes = { 'NvimTree' },
    },
    sections = {
        lualine_b = {
            'branch',
            'diff',
            { 'diagnostics', sources = { 'nvim_diagnostic', 'ale' } },
        },
        lualine_c = {
            { 'filename', path = 1, shorting_target = 50 },
            {
                'lsp_progress',
                display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
                timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
            },
        },
        lualine_x = {
            { getActiveLsp, icon = ' LSP:', color = { gui = 'bold' }, },
            'encoding',
            { 'filetype', icon_only = false },
            'filesize',
        },
    },
}
