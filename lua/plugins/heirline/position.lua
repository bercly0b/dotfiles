local conditions = require('heirline.conditions')

local Ruler = {
    provider = ' %3l:%2c ',

    hl = function()
        if conditions.is_active() then
            return { fg = 'gray', bg = 'fg3', bold = true }
        else
            return { fg = 'fg3', bg = 'bg1', bold = true }
        end
    end,
}

local ScrollBar ={
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,

    hl = function()
        if conditions.is_active() then
            return { fg = 'red', bg = 'fg3' }
        else
            return { fg = 'bg1', bg = 'bg1' }
        end
    end,
}

return { Ruler, ScrollBar }
