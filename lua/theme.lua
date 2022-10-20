-- require('onedark').load()

-- local colors = require('onedark.colors')

-- vim.cmd('highlight NvimTreeNormal guibg='..colors.bg0)
-- vim.cmd('highlight NvimTreeEndOfBuffer guibg='..colors.bg0)

require("gruvbox").setup({
  inverse = true,
  invert_selection = false,
  contrast = "soft", -- can be "hard", "soft" or empty string
})

vim.o.background = "light"
vim.cmd([[colorscheme gruvbox]])
