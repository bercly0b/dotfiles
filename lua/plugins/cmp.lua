vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local lspkind = require('lspkind')

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

    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = ({
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                luasnip = '[Snip]',
                nvim_lua = '[Lua]',
            })
        }),
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
    view = {
        entries = { name = 'wildmenu', separator = ' | ' }
    },
    sources = {
        {
            name = 'buffer',
            max_item_count = 10,
            keyword_length = 3,
        }
    }
})

cmp.setup.cmdline(':', {
    view = {
        entries = { name = 'wildmenu', separator = ' | ' }
    },
    sources = {
        {
            name = 'cmdline',
            max_item_count = 10,
            keyword_length = 3,
        }
    }
})
