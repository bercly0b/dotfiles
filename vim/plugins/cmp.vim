set completeopt=menu,menuone,noselect

lua <<EOF
    -- Setup nvim-cmp.
    local cmp = require'cmp'

    local lsp_installer = require('nvim-lsp-installer')
    lsp_installer.on_server_ready(function(server)
        local opts = {}

        server:setup(opts)
    end)

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },

        mapping = {
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },

        sources = cmp.config.sources({
                {
                    name = 'nvim_lsp',
                    max_item_count = 8,
                },
                {
                    name = 'buffer',
                    max_item_count = 5,
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end
                },
            },
            {
                { name = 'buffer' },
            }
        )
    })

    require'cmp'.setup.cmdline('/', {
        sources = {
            { name = 'buffer', keyword_length = 3 }
        }
    })

    require'cmp'.setup.cmdline(':', {
        sources = {
            { name = 'cmdline', keyword_length = 3 }
        }
    })

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    require('lspconfig').tsserver.setup { capabilities = capabilities }

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })
EOF
