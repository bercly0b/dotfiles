require('catppuccin').setup({
    flavour = 'latte', -- latte, frappe, macchiato, mocha
})

-- setup must be called before loading
vim.cmd.colorscheme('catppuccin')
