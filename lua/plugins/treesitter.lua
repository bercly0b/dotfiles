local nts = require('nvim-treesitter')

vim.treesitter.language.register('tsx', { 'javascript', 'typescript.tsx' })

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft == '' then return end

        local lang = vim.treesitter.language.get_lang(ft) or ft

        if vim.list_contains(nts.get_installed('parsers'), lang) then
            pcall(vim.treesitter.start, args.buf, lang)
            return
        end

        nts.install({ lang }):await(function(err)
            if err then return end
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].filetype == ft then
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end)
        end)
    end,
})

require('nvim-ts-autotag').setup({})
