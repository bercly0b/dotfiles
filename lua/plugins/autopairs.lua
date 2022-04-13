local autopairs = require('nvim-autopairs')

-- disable quotes autopair
autopairs.remove_rule('"')
autopairs.remove_rule("'")
