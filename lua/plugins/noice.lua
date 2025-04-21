local noice = require('noice')

noice.setup({
    cmdline = {
        view = "cmdline_popup",
    },
    views = {
        cmdline_popup = {
            position = {
                row = "35%",
            },
        },
    },
    messages = {
        enabled = false,
    },
    presets = {
        bottom_search = false,
        command_palette = true,
    },
})
