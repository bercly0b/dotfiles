local set = vim.opt

vim.g.mapleader = ' '
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

set.number = true
set.relativenumber = true

set.guifont = 'RobotoMono Nerd Font:h14'
set.cc = '0'

-- Ignore case when searching
set.smartcase = true
set.ignorecase = true
-- Show matching brackets when text indicator is over them
set.showmatch = true

set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.shiftround = true
set.scrolloff = 7

set.wildignore = set.wildignore + '*/node_modules/*,/.git/*'

-- if hidden is not set, TextEdit might fail.
set.hidden = true
-- Better display for messages
set.cmdheight = 2
-- You will have bad experience for diagnostic messages when it's default 4000.
set.updatetime = 300
-- don't give |ins-completion-menu| messages.
set.shortmess = set.shortmess + 'c'
-- always show signcolumns
set.signcolumn = 'yes'

set.termguicolors = true

local nvm_bins = vim.fn.glob(vim.env.HOME .. '/.nvm/versions/node/*/bin', 0, 1)
if #nvm_bins > 0 then
    table.sort(nvm_bins)
    local nvm_bin = nvm_bins[#nvm_bins]
    vim.env.PATH = nvm_bin .. ':' .. vim.env.PATH
    vim.g.node_path = nvm_bin .. '/node'
else
    vim.g.node_path = '/usr/bin/node'
end

-- Indent guides
vim.g.indent_guides_enable_on_vim_startup = 0

-- remove extra spaces on save file
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- for postcss highlight
vim.cmd('au BufNewFile,BufRead *.pcss setfiletype css')

-- disable relative string numbers on insert mode
vim.cmd([[
    augroup every
        autocmd!
        au InsertEnter * set norelativenumber
        au InsertLeave * set relativenumber
    augroup END
]])

vim.cmd('autocmd Filetype * if getfsize(@%) > 500000 | set ft=none | endif')
