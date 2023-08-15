local nvim_tree = require('nvim-tree')

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'v', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'I', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'N', api.fs.create,  opts('Create'))
    vim.keymap.set('n', 'D', api.fs.remove,  opts('Delete'))
    vim.keymap.set('n', 'o', api.node.run.system, opts('Run System'))
    vim.keymap.set('n', 'm', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', 'x', api.node.navigate.parent_close, opts('Close Directory'))
end

nvim_tree.setup({
    on_attach = on_attach,
    git = {
        ignore = false,
    },
    renderer = {
        special_files = { Makefile = 1, MAKEFILE = 1 },
    },
    view = {
        width = 40,
    }
})
