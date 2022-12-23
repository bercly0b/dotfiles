local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,

    static = {
        mode_names = {
            n = 'NOR',
            v = 'VIS',
            i = 'INS',
            R = 'REP',
            c = 'COM',
        },
        mode_colors = {
            n = 'fg3' ,
            i = 'green',
            v = 'cyan',
            V =  'cyan',
            ['\22'] =  'cyan',
            c =  'orange',
            s =  'purple',
            S =  'purple',
            ['\19'] =  'purple',
            R =  'orange',
            r =  'orange',
            ['!'] =  'red',
            t =  'red',
        }
    },

    provider = function(self)
        return '  ' ..self.mode_names[string.lower(self.mode:sub(1, 1))] or '???'.. ''
    end,

    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return {
            bg = self.mode_colors[mode],
            fg = 'gray',
            bold = true,
        }
    end,

    update = { 'ModeChanged' },

    { provider = ' ' },
}

return ViMode
