vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            buffer = { max_items = 3 },
        }
    },

    completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = {
            draw = {
                components = {
                    kind_icon = {
                        text = function(ctx)
                            return require('lspkind').symbol_map[ctx.kind] or ''
                        end,
                    }
                }
            }
        }
    },

    snippets = {
        preset = 'default',
    },
})
