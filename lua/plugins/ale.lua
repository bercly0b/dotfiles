vim.g.ale_linters = {
    javascript = { 'eslint', 'tsserver' },
    typescript = { 'eslint', 'tsserver', 'tslint' },
    json = { 'jsonlint', 'spectral' },
}

vim.g.ale_fixers = {
    ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
    javascript = { 'eslint' },
    typescript = { 'eslint', 'tslint' },
}

vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_lint_on_text_changed = 'never'

vim.g.ale_sign_error = '●'
vim.g.ale_sign_warning = '.'

vim.g.ale_typescript_tslint_use_global = 1

vim.g.ale_hover_cursor = 0

vim.cmd('highlight ALEErrorSign ctermbg=NONE ctermfg=red')
vim.cmd('highlight ALEWarningSign ctermbg=NONE ctermfg=yellow')

vim.cmd('autocmd FileType javascript,javascriptreact,typescript,javascript.jsx,typescript.tsx map <c-]> :ALEGoToDefinition<cr>')
vim.cmd('autocmd FileType typescriptreact set ft=typescript.tsx')
