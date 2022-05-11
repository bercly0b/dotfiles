local telescope = require('telescope')

telescope.setup({
    defaults = {
        preview = {
            treesitter = false,
        },
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
            horizontal = {
                height = 0.5,
                prompt_position = 'bottom',
                width = 0.7,
            },
        },
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
            layout_config = {
                horizontal = {
                    width = 0.4,
                    height = 0.3,
                },
            },
            previewer = false,
            prompt_title = false,
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
