require "nvchad.autocmds"

-- Open Nvimtree when entering Neovim
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
