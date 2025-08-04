local hl = vim.api.nvim_set_hl
local c = require "colors.vscode"

hl(0, "RainbowDelimiterRed", { fg = c.Pink, bg = "NONE" })
hl(0, "RainbowDelimiterOrange", { fg = c.Orange, bg = "NONE" })
hl(0, "RainbowDelimiterYellow", { fg = c.YellowOrange, bg = "NONE" })
hl(0, "RainbowDelimiterGreen", { fg = c.Green, bg = "NONE" })
hl(0, "RainbowDelimiterCyan", { fg = c.BlueGreen, bg = "NONE" })
hl(0, "RainbowDelimiterBlue", { fg = c.MediumBlue, bg = "NONE" })
hl(0, "RainbowDelimiterViolet", { fg = c.Violet, bg = "NONE" })

require("rainbow-delimiters.setup").setup {
  -- query = {
  --   tsx = "rainbow-parens",
  -- },
  highlight = {
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
    "RainbowDelimiterRed",
  },
}
