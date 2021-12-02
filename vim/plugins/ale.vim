let g:js_linters = ['eslint', 'tsserver']
let g:ts_linters = ['eslint', 'tsserver', 'tslint']

let g:ale_linters = {
    \ "javascript": js_linters,
    \ "typescript": ts_linters,
    \ "json": ['jsonlint', 'spectral'],
    \ }
let g:js_fixers = ['eslint']
let g:ts_fixers = ['eslint', 'tslint']
let g:ale_fixers = {
    \ "*": ['remove_trailing_lines', 'trim_whitespace'],
    \ "javascript": js_fixers,
    \ "typescript": ts_fixers,
    \ }
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = "never"

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_typescript_tslint_use_global = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'ok' : printf(
        \   '%dW %dE ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

autocmd FileType javascript,javascriptreact,typescript,javascript.jsx,typescript.tsx map <c-]> :ALEGoToDefinition<cr>
autocmd FileType typescriptreact set ft=typescript.tsx
