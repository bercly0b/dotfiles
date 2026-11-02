-- Ghostty's theme line is the light/dark switch. The repo is cloned on servers
-- too, so nvim there matches the Mac terminal.
local function ghostty_is_dark()
    local path = vim.fn.expand('~/self/dotfiles/ghostty/config')
    if vim.fn.filereadable(path) == 0 then
        return false
    end
    for _, line in ipairs(vim.fn.readfile(path)) do
        if line:match('^theme%s*=') then
            return line:match('Dark') ~= nil
        end
    end
    return false
end

vim.cmd.colorscheme(ghostty_is_dark() and 'flexoki-dark' or 'flexoki-light')
