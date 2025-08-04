local nvchad_opts = require "nvchad.configs.telescope"
local merge_tb = vim.tbl_deep_extend
local opts = {
  extensions = {
    ["ui-select"] = require("telescope.themes").get_dropdown {},
  },

  extensions_list = {
    "themes",
    "terms",
    "ui-select",
    "fzf",
  },
}

print "Creating telescope conf"

return merge_tb("force", nvchad_opts, opts)
