require("luasnip.loaders.from_vscode").lazy_load()

-- For some reason this doesn't work, the snippets dont get loaded. To be investigated
-- require("luasnip/loaders/from_vscode").load({ paths = { "./my-snippets" } })
require("luasnip").config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}

-- Configure SourceSnippets command to resource this file
vim.cmd("command! SourceSnippets luafile " .. vim.fn.expand "%")
