local status_ok, _ = pcall(require, 'impatient')

if not status_ok then
    vim.notify('impatient not instaled!')
end

require('performance')

require('init-plugs')

require('settings')
require('theme')
require('keymaps')

-- require('plugins/autopairs')
require('plugins/cmp')
require('plugins/git')
require('plugins/luasnip')
require('plugins/lsp')
require('plugins/null-ls')
require('plugins/tree')
require('plugins/telescope')
require('plugins/lualine')
require('plugins/treesitter')
