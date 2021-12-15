colorscheme onedark

set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:one_allow_italics = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:vim_jsx_pretty_colorful_config = 1

lua <<EOF
    local colors = require('onedark.colors')
    vim.cmd('highlight NvimTreeNormal guibg='..colors.bg0)
    vim.cmd('highlight NvimTreeEndOfBuffer guibg='..colors.bg0)
EOF
