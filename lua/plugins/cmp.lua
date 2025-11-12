vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('blink.cmp')


cmp.setup({
    keymap = {
        preset = 'default',
        ['<C-j>'] = { 'show', 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-[>'] = {
            function(cmp_)
                cmp_.hide()
                return false
            end,
            'fallback',
        },
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
            ['<C-j>'] = { 'show', 'select_next' },
            ['<C-k>'] = { 'select_prev' },
            ['<C-[>'] = {
                function(cmp_)
                    cmp_.hide()
                    return false
                end,
                'fallback',
            },
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },
})
