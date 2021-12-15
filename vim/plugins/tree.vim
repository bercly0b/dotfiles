" disable status line for tree
au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif

lua <<EOF
    local nvim_tree = require('nvim-tree')
    local tree_cb = require('nvim-tree.config').nvim_tree_callback

    nvim_tree.setup({
        view = {
            width = 40,
            mappings = {
                list = {
                    { key = 'P', cb = tree_cb('parent_node') },
                    { key = 's', cb = tree_cb('split') },
                    { key = 'v', cb = tree_cb('vsplit') },
                    { key = '?', cb = tree_cb('toggle_help') },
                    { key = 'x', cb = tree_cb('close_node') },
                    { key = 'I', cb = tree_cb('toggle_dotfiles') },
                    { key = 'y', cb = tree_cb('copy_name') },
                    { key = 'Y', cb = tree_cb('copy_path') },
                    { key = 'gy', cb = tree_cb('copy_absolute_path') },
                    { key = 'R', cb = tree_cb('refresh') },
                    { key = 'N', cb = tree_cb('create') },
                    { key = 'D', cb = tree_cb('remove') },
                    { key = 'o', cb = tree_cb('system_open') },
                    { key = 'c', cb = tree_cb('copy') },
                    { key = 'p', cb = tree_cb('paste') },
                    { key = 'r', cb = tree_cb('rename') },
                }
            }
        }
    })
EOF
