vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
           require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        {
            name = 'buffer',
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        },
    },
    {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    sources = {
        {
            name = 'buffer',
            max_item_count = 8,
            keyword_length = 5,
        }
    }
})

cmp.setup.cmdline(':', {
    sources = {
        {
            name = 'cmdline',
            max_item_count = 8,
            keyword_length = 3,
        }
    }
})

-- local luasnip = require('luasnip')
-- luasnip.snippets = {}

-- require('luasnip.loaders.from_vscode').load()
-- require'luasnip'.filetype_extend("typescript.tsx", {"javascript"})

-- luasnip.filetype_extend('all', { '_' })
-- require('luasnip.loaders.from_snipmate').load({ include = { 'typescript', 'javascript' } })
