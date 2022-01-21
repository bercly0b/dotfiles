local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- buffer resize
map('n', '<leader>=', ':exe "vertical resize +10"<CR>', default_opts)
map('n', '<leader>-', ':exe "vertical resize -10"<CR>', default_opts)

-- Switch CWD to the directory of the open buffer
map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', { silent = true })

map('n', '<leader>n', ':noh<CR>', default_opts)

-- Bufexplorer
map('n', '<leader>o', ':BufExplorer<CR>', default_opts)

-- Fugitive
map('n', '<leader>gs', ':Gstatus<CR>', default_opts)
-- Fugitive Conflict Resolution
map('n', '<leader>gd', ':Gvdiff!<CR>', default_opts)
map('n', 'gdh', ':diffget //2<CR>', default_opts)
map('n', 'gdl', ':diffget //3<CR>', default_opts)

-- add new line in normal mode
map('n', '<S-CR>', 'O<Esc>j', { silent = true })
map('n', '<CR>', 'o<Esc>k', { silent = true })

-- copy/paste snippet
map('v', '<c-c>', '"*y', default_opts)
map('n', '<c-v>', '"*p', default_opts)

map('n', '<C-g>h', ':OpenGithubFile<CR>', { silent = true })

map('i', 'jj', '<Esc>', { noremap = true })

-- ale
map('n', '<leader>k', '<Plug>(ale_previous_wrap)', { silent = true })
map('n', '<leader>j', '<Plug>(ale_next_wrap)', { silent = true })
map('n', '<leader>t', ':ALEToggle<CR>', default_opts)
map('n', '<leader>s', ':ALEFix<CR>', default_opts)

-- tree
map('n', '<leader><leader>', ':NvimTreeToggle<CR>', default_opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)
map('n', '<leader>/', ':NvimTreeFindFile<CR>', default_opts)

-- fzf
map('n', '<Leader>a', ':Ag<CR>', default_opts)
map('n', '<Leader>f', ':Files<CR>', default_opts)

-- lsp
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', 'L', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opts)

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })
map('n', 'gt', 'vim.lsp.buf.type_definition()<CR>', { silent = true })
map('n', 'gi', 'vim.lsp.buf.implementation()<CR>', { silent = true })

-- json prettify
vim.cmd('command! JSONprettify %!python -m json.tool')