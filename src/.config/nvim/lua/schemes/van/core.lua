local colors = require('schemes.van.palette')

local core = {
    Normal                       = { fg = colors.Gray16 },
    Comment                      = { fg = colors.Gray8, italic = true },
    SpecialComment               = { fg = colors.Gray8, italic = true  },
    Todo                         = { fg = colors.Gray8, italic = true },

    Visual                       = { fg = colors.Blue0, bg = colors.Blue16 },
    Cursor                       = { fg = colors.Gray0, bg = colors.Gray24 },
    CursorLine                   = { bg = colors.Gray3 },
    LineNr                       = { fg = colors.Gray6 },
    CursorLineNr                 = { fg = colors.Gray24, bg = colors.Gray3, bold = true },
    Search                       = { fg = colors.Yellow18, bg = colors.Yellow8 },
    MatchParen                   = { fg = colors.Yellow18, bold = true },
    WinSeparator                 = { fg = colors.Gray3 },

    StatusLine                   = { fg = colors.Gray8 },

    Boolean                      = { fg = colors.Wine12, bold = true },
    Number                       = { fg = colors.Orange12 },
    Float                        = { fg = colors.Yellow12 },
    Character                    = { fg = colors.Coral16, bold = true },
    String                       = { fg = colors.Red8 },

    Keyword                      = { fg = colors.Gray24, bold = true },
    Operator                     = { fg = colors.Rose18, bold = true },
    Tag                          = { fg = colors.Gray24, bold = true },
    Type                         = { fg = colors.Orchid12 },
    Identifier                   = { fg = colors.Magenta12 },
    Constant                     = { fg = colors.Azure12 },
    Function                     = { fg = colors.Blue16 },
    Macro                        = { fg = colors.Indigo12 },
    Structure                    = { fg = colors.Mint12 },
    StorageClass                 = { fg = colors.Gray24, bold = true },
    Typedef                      = { fg = colors.Cobalt18, bold = true },
    PreProc                      = { fg = colors.Cobalt18, bold = true },
    Include                      = { fg = colors.Raspberry18, bold = true },
    Define                       = { fg = colors.Cobalt18, bold = true },
    Exception                    = { fg = colors.Red18, bold = true },

    PreCondit                    = { fg = colors.Rose18, bold = true },
    Conditional                  = { fg = colors.Rose18, bold = true },
    Repeat                       = { fg = colors.Orange18, bold = true },

    SpecialChar                  = { fg = colors.Orange12, bold = true },

    Special                      = { fg = colors.Rose18 },
    Delimiter                    = { fg = colors.Gray18 },
    PunctuationBracket           = { fg = colors.Cyan8 },

    Title                        = { fg = colors.Gray24 },
    Label                        = { fg = colors.Gray16 },
    Bold                         = { bold = true },
    Italic                       = { italic = true },
    Underlined                   = { underline = true },

    Directory                    = { fg = colors.Blue16 },
    SpecialKey                   = { fg = colors.Gray24 },
    NonText                      = { fg = colors.Gray4 },

    FoldColumn                   = { fg = colors.Blue16 },
    Folded                       = { fg = colors.Blue16 },

    DiffAdd                      = { fg = colors.Blue20 },
    DiffText                     = { fg = colors.Gray20 },
    DiffChange                   = { fg = colors.Yellow12 },
    DiffChangeDelete             = { fg = colors.Orange12 },
    DiffDelete                   = { fg = colors.Red12, strikethrough = true },

    healthError                  = { fg = colors.Red20 },
    healthWarning                = { fg = colors.Orange20 },
    healthSuccess                = { fg = colors.Green20 },

    Error                        = { fg = colors.Red20 },
    Warning                      = { fg = colors.Orange20 },
    Info                         = { fg = colors.Blue20 },
    Hint                         = { fg = colors.Indigo20 },
    ErrorMsg                     = { fg = colors.Red20 },
    WarningMsg                   = { fg = colors.Orange20 },
    Question                     = { fg = colors.Indigo20 },
    MoreMsg                      = { fg = colors.Gray20 },

    DiagnosticError              = { fg = colors.Red20 },
    DiagnosticWarn               = { fg = colors.Orange20 },
    DiagnosticInfo               = { fg = colors.Blue20 },
    DiagnosticHint               = { fg = colors.Indigo20 },
    DiagnosticUnnecessary        = { fg = colors.Gray20 },
    DiagnosticVirtualTextError   = { fg = colors.Red20 },
    DiagnosticVirtualTextWarn    = { fg = colors.Orange20 },
    DiagnosticVirtualTextInfo    = { fg = colors.Blue20 },
    DiagnosticVirtualTextHint    = { fg = colors.Indigo20 },
    DiagnosticUnderlineError     = { fg = colors.Red20 },
    DiagnosticUnderlineWarn      = { fg = colors.Orange20 },
    DiagnosticUnderlineInfo      = { fg = colors.Blue20 },
    DiagnosticUnderlineHint      = { fg = colors.Indigo20 },
}

return core
