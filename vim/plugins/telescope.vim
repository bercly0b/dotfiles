lua << END
    require('telescope').setup({
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
            file_ignore_patterns = {
                '^node_modules/',
                '^__reports/',
                '^releases/',
                '^.git/',
                'package%-lock.json',
                '^build/',
                '^dist/',
                '^ci/',
                '%.png',
            },
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--trim',
                '--ignore-file=~/self/dotfiles/.fdignore',
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
            buffers = {
                theme = 'dropdown',
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

    require('telescope').load_extension('fzf')
END
