-- Ghostty's `theme = Catppuccin <Flavor>` line picks the flavor. The repo is
-- cloned on servers too, so nvim there matches the Mac terminal.
local function ghostty_flavor()
    local path = vim.fn.expand('~/self/dotfiles/ghostty/config')
    if vim.fn.filereadable(path) == 1 then
        for _, line in ipairs(vim.fn.readfile(path)) do
            local flavor = line:match('^theme%s*=%s*Catppuccin%s+(%a+)')
            if flavor then
                return flavor:lower()
            end
        end
    end
    return 'latte'
end

vim.cmd.colorscheme('catppuccin-' .. ghostty_flavor())
