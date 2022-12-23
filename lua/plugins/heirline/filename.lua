local utils = require('heirline.utils')
local conditions = require('heirline.conditions')

local FileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}

local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (self.icon .. ' ')
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}

local FileName = {
    provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ':.')
        if filename == '' then return '[No Name]' end
        -- now, if the filename would occupy more than 1/4th of the available space, we trim the file path to its initials
        if not conditions.width_percent_below(#filename, 0.45) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = function()
        if vim.bo.modified then
            return { fg = 'fg4', bold = true, force=true }
        else
            return { fg = 'fg4' }
        end
    end,
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = ' +',
        hl = { fg = 'fg4' },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = ' ',
        hl = { fg = 'orange' },
    },
}

FileNameBlock = utils.insert(
    FileNameBlock,
    { provider = ' ' },
    FileIcon,
    FileName,
    FileFlags,
    { provider = '%<'} -- this means that the statusline is cut here when there's not enough space
)

return FileNameBlock
