local heirline = require('heirline')
local utils = require('heirline.utils')
local conditions = require('heirline.conditions')

local ViMode = require('plugins.heirline.vimode')
local Git = require('plugins.heirline.git')
local Diagnostic = require('plugins.heirline.diagnostics')
local FileName = require('plugins.heirline.filename')
local LSPActive = require('plugins.heirline.lsp')
local Position = require('plugins.heirline.position')
local FileSize = require('plugins.heirline.filesize')
local SearchResults = require('plugins.heirline.search')

local Align = { provider = '%=' }

heirline.load_colors({
    bright_bg = utils.get_highlight('Folded').bg,
    bright_fg = utils.get_highlight('Folded').fg,
    red = utils.get_highlight('DiagnosticError').fg,
    dark_red = utils.get_highlight('DiffDelete').bg,
    green = utils.get_highlight('String').fg,
    blue = utils.get_highlight('Function').fg,
    gray = utils.get_highlight('NonText').fg,
    orange = utils.get_highlight('Constant').fg,
    purple = utils.get_highlight('Statement').fg,
    cyan = utils.get_highlight('Special').fg,
    diag_warn = utils.get_highlight('DiagnosticWarn').fg,
    diag_error = utils.get_highlight('DiagnosticError').fg,
    diag_hint = utils.get_highlight('DiagnosticHint').fg,
    diag_info = utils.get_highlight('DiagnosticInfo').fg,
    git_add = utils.get_highlight('diffAdded').fg,
    git_change = utils.get_highlight('diffChanged').fg,

    bg0 = utils.get_highlight('GruvboxBg0').fg,
    bg1 = utils.get_highlight('GruvboxBg1').fg,
    bg2 = utils.get_highlight('GruvboxBg2').fg,
    bg3 = utils.get_highlight('GruvboxBg3').fg,
    bg4 = utils.get_highlight('GruvboxBg4').fg,

    fg0 = utils.get_highlight('GruvboxFg0').fg,
    fg1 = utils.get_highlight('GruvboxFg1').fg,
    fg2 = utils.get_highlight('GruvboxFg2').fg,
    fg3 = utils.get_highlight('GruvboxFg3').fg,
    fg4 = utils.get_highlight('GruvboxFg4').fg,
})

local DefaultStatusLine = {
    ViMode, Git, FileName, Align,
    SearchResults, Diagnostic, LSPActive, Align,
    FileSize, Position,

    hl = { bg = 'bg1' },
}

local InactiveStatusLine = {
    condition = conditions.is_not_active,

    hl = { bg = 'bg1' },

    FileName, Align, Position,
}

local NoneStatusLine = {
    condition = function()
        return conditions.buffer_matches({
            filetype = { 'NvimTree' },
        })
    end,

    hl = { bg = 'bg0' },

    Align,
}

heirline.setup({
    fallthrough = false,
    NoneStatusLine, InactiveStatusLine, DefaultStatusLine,
})
