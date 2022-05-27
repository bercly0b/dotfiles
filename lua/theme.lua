require('onedark').load()

local colors = require('onedark.colors')

vim.cmd('highlight NvimTreeNormal guibg='..colors.bg0)
vim.cmd('highlight NvimTreeEndOfBuffer guibg='..colors.bg0)
