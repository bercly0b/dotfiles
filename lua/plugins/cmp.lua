vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-[>'] = { 'hide', 'fallback' },
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
        ghost_text = {
            enabled = false
        },
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

    cmdline = {
        sources = { 'cmdline' },
        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false
                }
            }
        },
        keymap = {
            ['<C-j>'] = { 'select_next' },
            ['<C-k>'] = { 'select_prev' },
            ['<C-[>'] = { 'hide' },
            ['<CR>'] = { 'accept', 'fallback' },
        },
    },
})
