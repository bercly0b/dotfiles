vim.cmd('colorscheme onedark')

vim.o.background = 'dark'

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR=1

vim.g.javascript_plugin_jsdoc = 1
vim.g.javascript_plugin_ngdoc = 1
vim.g.vim_jsx_pretty_colorful_config = 1

local colors = require('onedark.colors')

vim.cmd('highlight NvimTreeNormal guibg='..colors.bg0)
vim.cmd('highlight NvimTreeEndOfBuffer guibg='..colors.bg0)
