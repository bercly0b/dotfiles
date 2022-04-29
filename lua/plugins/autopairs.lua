local autopairs = require('nvim-autopairs')

autopairs.setup({})

-- disable quotes autopair
autopairs.remove_rule('"')
autopairs.remove_rule("'")
