-- Location: ~/.config/nvim/lua/custom/themes/vscode_dark.lua

local M = {}
M.type = "dark"

-- @VSCodeColors
local vsc = require "colors.vscode"

--[[
  M.base_30 palette with original NvChad key names.
  We are assigning the authentic VS Code colors defined above to these keys.
]]
M.base_30 = {
  -- Core UI Colors mapped to their NvChad names
  white = vsc.Front,
  darker_black = vsc.BackDarker, -- Kept for subtle UI differences
  black = vsc.Back, -- nvim bg
  black2 = vsc.LeftDark,
  one_bg = vsc.TabOther,
  one_bg2 = vsc.LeftMid,
  one_bg3 = vsc.Context,
  grey = vsc.SplitDark,
  grey_fg = vsc.Green, -- Comments are the most prominent "grey_fg"
  grey_fg2 = vsc.LineNumber,
  light_grey = vsc.Gray,
  -- UI Elements
  line = vsc.SplitDark, -- for lines like vertsplit
  statusline_bg = vsc.LeftDark,
  lightbg = "#303030", -- Original value, can be tweaked
  pmenu_bg = vsc.Selection,
  folder_bg = "#7A8A92", -- Kept original
  -- Syntax Colors mapped to their NvChad names
  red = vsc.LightRed, -- This is used in GitModified
  baby_pink = vsc.LightRed, -- Mapped to LightRed, often used for regex
  pink = vsc.Pink, -- Mapped to storage keywords
  green = vsc.Green,
  green1 = vsc.LightGreen, -- Mapped to numbers/constants
  vibrant_green = vsc.GitAdded,
  blue = vsc.Blue, -- Mapped to primary keywords
  nord_blue = vsc.AccentBlue,
  yellow = vsc.Yellow,
  sun = vsc.YellowOrange, -- Mapped to function calls
  purple = vsc.Pink, -- Both pink and purple map to storage keywords
  dark_purple = vsc.Violet,
  teal = vsc.BlueGreen, -- Mapped to types/classes
  orange = vsc.Orange, -- Mapped to strings
  cyan = vsc.LightBlue, -- Mapped to variables
}

--[[
  Base16 mapping based on the detailed definitions.
  This ensures plugins that use base16 standards look correct.
]]
M.base_16 = {
  base00 = vsc.Back,
  base01 = vsc.LeftDark,
  base02 = vsc.Selection,
  base03 = vsc.Green, -- Comments
  base04 = vsc.PopupFront, -- Dark Foreground
  base05 = vsc.Front, -- Default Foreground
  base06 = "#E9E9E9", -- Light Foreground (Original value)
  base07 = "#FFFFFF", -- Light Background (Original value)
  base08 = vsc.LightBlue, -- Variables
  base09 = vsc.LightGreen, -- Numbers, Booleans
  base0A = vsc.BlueGreen, -- Classes, Types
  base0B = vsc.Orange, -- Strings
  base0C = vsc.LightRed, -- Regex, Support
  base0D = vsc.YellowOrange, -- Functions
  base0E = vsc.Pink, -- Keywords, Storage
  base0F = vsc.Gray, -- Deprecated
}

--[[
  This section applies the colors to Treesitter highlights.
  It uses the ORIGINAL NvChad keys from base_30 and base_16.
]]
M.polish_hl = {
  defaults = {
    Normal = { fg = vsc.Front, bg = vsc.Back },
    ColorColumn = { fg = "NONE", bg = vsc.CursorDarkDark },
    Cursor = { fg = vsc.CursorDark, bg = vsc.CursorLight },
    CursorLine = { bg = vsc.CursorDarkDark },
    CursorColumn = { fg = "NONE", bg = vsc.CursorDarkDark },
    Directory = { fg = vsc.Blue, bg = vsc.Back },
    DiffAdd = { fg = "NONE", bg = vsc.DiffGreenLight },
    DiffChange = { fg = "NONE", bg = vsc.DiffRedDark },
    DiffDelete = { fg = "NONE", bg = vsc.DiffRedLight },
    DiffText = { fg = "NONE", bg = vsc.DiffRedLight },
    EndOfBuffer = { fg = vsc.Back, bg = "NONE" },
    ErrorMsg = { fg = vsc.Red, bg = vsc.Back },
    VertSplit = { fg = vsc.SplitDark, bg = vsc.Back },
    WinSeparator = { link = "VertSplit" },
    Folded = { fg = "NONE", bg = vsc.FoldBackground },
    FoldColumn = { fg = vsc.LineNumber, bg = vsc.Back },
    SignColumn = { fg = "NONE", bg = vsc.Back },
    IncSearch = { fg = vsc.None, bg = vsc.SearchCurrent },
    LineNr = { fg = vsc.LineNumber, bg = vsc.Back },
    CursorLineNr = { fg = vsc.PopupFront, bg = vsc.Back },
    MatchParen = { fg = vsc.None, bg = vsc.DimHighlight },
    ModeMsg = { fg = vsc.Front, bg = vsc.LeftDark },
    MoreMsg = { fg = vsc.Front, bg = vsc.LeftDark },
    NonText = { fg = vsc.LineNumber, bg = vsc.None },
    Pmenu = { fg = vsc.PopupFront, bg = vsc.PopupBack },
    PmenuSel = { fg = vsc.PopupFront, bg = vsc.PopupHighlightBlue },
    PmenuSbar = { fg = "NONE", bg = vsc.PopupHighlightGray },
    PmenuThumb = { fg = "NONE", bg = vsc.PopupFront },
    Question = { fg = vsc.Blue, bg = vsc.Back },
    Search = { fg = vsc.None, bg = vsc.Search },
    SpecialKey = { fg = vsc.Blue, bg = vsc.None },
    StatusLine = { fg = vsc.Front, bg = vsc.LeftMid },
    StatusLineNC = { fg = vsc.Front, bg = vsc.LeftDark },
    TabLine = { fg = vsc.Front, bg = vsc.TabOther },
    TabLineFill = { fg = vsc.Front, bg = vsc.TabOutside },
    TabLineSel = { fg = vsc.Front, bg = vsc.TabCurrent },
    Title = { fg = vsc.None, bg = vsc.None, bold = true },
    Visual = { fg = vsc.None, bg = vsc.Selection },
    VisualNOS = { fg = vsc.None, bg = vsc.Selection },
    WarningMsg = { fg = vsc.Yellow, bg = vsc.Back },
    WildMenu = { fg = vsc.None, bg = vsc.Selection },
    SpellBad = { fg = "NONE", undercurl = true, sp = vsc.Red },
    SpellCap = { fg = "NONE", undercurl = true, sp = vsc.Yellow },
    SpellRare = { fg = "NONE", undercurl = true, sp = vsc.Violet },
    SpellLocal = { fg = "NONE", undercurl = true, sp = vsc.Blue },
    Whitespace = { fg = vsc.LineNumber },
    NormalFloat = { bg = vsc.PopupBack },
    WinBar = { fg = vsc.Front, bg = vsc.Back, bold = true },
    WinBarNc = { fg = vsc.Front, bg = vsc.Back },
    QuickFixLine = { bold = true },
  },
  syntax = {
    Comment = { fg = vsc.Green, bg = "NONE" },
    Constant = { fg = vsc.Blue, bg = "NONE" },
    String = { fg = vsc.Orange, bg = "NONE" },
    Character = { fg = vsc.Orange, bg = "NONE" },
    Number = { fg = vsc.LightGreen, bg = "NONE" },
    Boolean = { fg = vsc.Blue, bg = "NONE" },
    Float = { fg = vsc.LightGreen, bg = "NONE" },
    Identifier = { fg = vsc.LightBlue, bg = "NONE" },
    Function = { fg = vsc.Yellow, bg = "NONE" },
    Statement = { fg = vsc.Pink, bg = "NONE" },
    Conditional = { fg = vsc.Pink, bg = "NONE" },
    Repeat = { fg = vsc.Pink, bg = "NONE" },
    Label = { fg = vsc.Pink, bg = "NONE" },
    Operator = { fg = vsc.Front, bg = "NONE" },
    Keyword = { fg = vsc.Pink, bg = "NONE" },
    Exception = { fg = vsc.Pink, bg = "NONE" },
    PreProc = { fg = vsc.Pink, bg = "NONE" },
    Include = { fg = vsc.Pink, bg = "NONE" },
    Define = { fg = vsc.Pink, bg = "NONE" },
    Macro = { fg = vsc.Pink, bg = "NONE" },
    Type = { fg = vsc.Blue, bg = "NONE" },
    StorageClass = { fg = vsc.Blue, bg = "NONE" },
    Structure = { fg = vsc.BlueGreen, bg = "NONE" },
    Typedef = { fg = vsc.Blue, bg = "NONE" },
    Special = { fg = vsc.YellowOrange, bg = "NONE" },
    SpecialChar = { fg = vsc.Front, bg = "NONE" },
    Tag = { fg = vsc.Front, bg = "NONE" },
    Delimiter = { fg = vsc.Front, bg = "NONE" },
    SpecialComment = { fg = vsc.Green, bg = "NONE" },
    Debug = { fg = vsc.Front, bg = "NONE" },
    Underlined = { fg = vsc.None, bg = "NONE", underline = true },
    Conceal = { fg = vsc.Front, bg = vsc.Back },
    Ignore = { fg = vsc.Front, bg = "NONE" },
    Error = { fg = vsc.Red, bg = vsc.Back, undercurl = true, sp = vsc.Red },
    Todo = { fg = vsc.YellowOrange, bg = vsc.Back, bold = true },
  },
  treesitter = {
    ["@error"] = { fg = vsc.Red },
    ["@punctuation.bracket"] = { fg = vsc.Front },
    ["@punctuation.special"] = { fg = vsc.Front },
    ["@punctuation.delimiter"] = { fg = vsc.Front },
    ["@comment"] = { fg = vsc.Green },
    ["@comment.note"] = { fg = vsc.BlueGreen },
    ["@comment.warning"] = { fg = vsc.YellowOrange },
    ["@comment.error"] = { fg = vsc.Red },
    ["@constant"] = { fg = vsc.AccentBlue },
    ["@constant.builtin"] = { fg = vsc.Blue },
    ["@constant.macro"] = { fg = vsc.BlueGreen },
    ["@string.regexp"] = { fg = vsc.Orange },
    ["@string"] = { fg = vsc.Orange },
    ["@character"] = { fg = vsc.Orange },
    ["@number"] = { fg = vsc.LightGreen },
    ["@number.float"] = { fg = vsc.LightGreen },
    ["@boolean"] = { fg = vsc.Blue },
    ["@annotation"] = { fg = vsc.Yellow },
    ["@attribute"] = { fg = vsc.Yellow },
    ["@attribute.builtin"] = { fg = vsc.BlueGreen },
    ["@module"] = { fg = vsc.BlueGreen },
    ["@function"] = { fg = vsc.Yellow },
    ["@function.builtin"] = { fg = vsc.Yellow },
    ["@function.macro"] = { fg = vsc.Yellow },
    ["@function.method"] = { fg = vsc.Pink },
    ["@function.method.call"] = { fg = vsc.Yellow },
    ["@function.call"] = { fg = vsc.Yellow },
    ["@define"] = { fg = vsc.Pink },
    ["@variable"] = { fg = vsc.AccentBlue },
    ["@variable.builtin"] = { fg = vsc.Blue },
    ["@variable.parameter"] = { fg = vsc.LightBlue },
    ["@variable.parameter.reference"] = { fg = vsc.LightBlue },
    ["@variable.member"] = { fg = vsc.LightBlue },
    ["@property"] = { fg = vsc.LightBlue },
    ["@constructor"] = { fg = vsc.Blue },
    ["@label"] = { fg = vsc.LightBlue },
    ["@keyword"] = { fg = vsc.Blue },
    ["@keyword.conditional"] = { fg = vsc.Pink },
    ["@keyword.repeat"] = { fg = vsc.Pink },
    ["@keyword.return"] = { fg = vsc.Pink },
    ["@keyword.exception"] = { fg = vsc.Pink },
    ["@keyword.import"] = { fg = vsc.Pink },
    ["@include"] = { fg = vsc.Pink },
    ["@operator"] = { fg = vsc.Front },
    ["@type"] = { fg = vsc.BlueGreen },
    ["@type.qualifier"] = { fg = vsc.Blue },
    ["@structure"] = { fg = vsc.LightBlue },
    ["@tag"] = { fg = vsc.Blue },
    ["@tag.builtin"] = { fg = vsc.Blue },
    ["@tag.delimiter"] = { fg = vsc.Gray },
    ["@tag.attribute"] = { fg = vsc.LightBlue },
  },
  nvimtree = {
    NvimTreeRootFolder = { fg = vsc.Front, bg = "NONE", bold = true },
    NvimTreeImageFile = { fg = vsc.Violet, bg = "NONE" },
    NvimTreeEmptyFolderName = { fg = vsc.Gray, bg = "NONE" },
    NvimTreeFolderName = { fg = vsc.Front, bg = "NONE" },
    NvimTreeSpecialFile = { fg = vsc.Pink, bg = "NONE", underline = true },
    NvimTreeNormal = { fg = vsc.Front, bg = vsc.BackDarker },
    NvimTreeCursorLine = { fg = "NONE", bg = vsc.LeftMid },
    NvimTreeVertSplit = { fg = vsc.Back, bg = vsc.Back },
    NvimTreeEndOfBuffer = { fg = vsc.LeftDark },
    NvimTreeOpenedFolderName = { fg = "NONE", bg = vsc.LeftDark },
    NvimTreeGitStaged = { fg = vsc.GitStageModified, bg = "NONE" },
    NvimTreeGitMerge = { fg = vsc.GitUntracked, bg = "NONE" },
    NvimTreeGitRenamed = { fg = vsc.GitRenamed, bg = "NONE" },
    NvimTreeGitDirty = { fg = vsc.GitModified },
    NvimTreeGitNew = { fg = vsc.GitAdded },
    NvimTreeGitDeleted = { fg = vsc.GitModified },
  },
  telescope = {
    TelescopePromptBorder = { fg = vsc.LineNumber, bg = "NONE" },
    TelescopePromptTitle = { fg = vsc.Front, bg = "NONE" },
    TelescopeResultsBorder = { fg = vsc.LineNumber, bg = "NONE" },
    TelescopePreviewBorder = { fg = vsc.LineNumber, bg = "NONE" },
    TelescopePreviewTitle = { fg = vsc.Front, bg = "NONE" },
    TelescopeNormal = { fg = vsc.Front, bg = "NONE" },
    TelescopeSelection = { fg = vsc.Front, bg = vsc.PopupHighlightBlue },
    TelescopeMultiSelection = { fg = vsc.Front, bg = vsc.PopupHighlightBlue },
    TelescopeMatching = { fg = vsc.MediumBlue, bg = "NONE", bold = true },
    TelescopePromptPrefix = { fg = vsc.Front, bg = "NONE" },
  },
}

-- This finalizes the theme override for NvChad
M = require("base46").override_theme(M, "vscode")

return M
