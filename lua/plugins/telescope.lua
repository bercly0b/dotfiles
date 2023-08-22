local telescope = require('telescope')

telescope.setup({
    defaults = {
        -- preview = {
        --     treesitter = false,
        -- },
        mappings = {
            i = {
                ['<C-j>'] = 'move_selection_next',
                ['<C-k>'] = 'move_selection_previous',
            }
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
            '--ignore-file', vim.fn.expand('~/self/dotfiles/.rgignore'),
        },
        layout_config = {
            vertical = {
                height = 0.99,
                width = 0.99,
                preview_cutoff = 10,
                prompt_position = 'top',
            },
        },
        layout_strategy = 'vertical',
        sorting_strategy = 'ascending',
    },
    pickers = {
        find_files = {
            find_command = {
                'fd',
                '--type', 'file',
                '--type', 'symlink',
                '--hidden',
                '--ignore-file', vim.fn.expand('~/self/dotfiles/.rgignore'),
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
})

telescope.load_extension('fzf')
