require "nvchad.mappings"
local utils = require "utils"

local map = vim.keymap.set
local del = vim.keymap.del

-- Removals from NvChad defaults
del("n", "<leader>e") -- Open NvimTree
del("n", "<C-n>") -- Open NvimTree
del("n", "<leader>th") -- Telescope themes
del("n", "<leader>cm") -- Telescope git commits
del("n", "<leader>ch") -- NvCheatSheet
del("i", "<Tab>")
del("i", "<S-Tab>")

-- General Keymaps
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center" })
map("n", "<C-q>", "<C-w>q", { desc = "Close window" })
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Edit all hovered word" })
map("n", "<Esc>", function()
  utils.OnEscape()
end, { desc = "Close floating windows and remove search" })
map("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
map("n", "<leader>R", function()
  utils.ReloadConfig()
end, { desc = "Reload config" })
map("n", "<leader>X", function()
  require("nvchad.tabufline").closeBufs_at_direction "right"
  require("nvchad.tabufline").closeBufs_at_direction "left"
end, { desc = "Close all but this buffer" })
map("n", "<leader>?", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" })

map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<leader>s", [["hy:%s/<C-r>h//gI<Left><Left><Left>]], { desc = "Edit all selected word" })

-- Comment Keymaps (requires 'Comment.nvim' plugin)
map("n", "<leader>c", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (linewise)" })
map(
  "v",
  "<leader>c",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment (linewise visual)" }
)

---NvimTree
map("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>T", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Telescope Keymaps (requires 'nvim-telescope/telescope.nvim' plugin)
map("n", "<C-p>", function()
  -- Assuming utils.HandleCtrlP() exists and is accessible
  utils.HandleCtrlP()
end, { desc = "Find files" })

-- LSP Config Keymaps (built-in Neovim LSP)
map("n", "K", function()
  vim.lsp.buf.hover { border = "rounded" }
end, { desc = "LSP hover" })
map("n", "Md", function()
  vim.diagnostic.jump { count = -1 }
end, { desc = "Go to previous diagnostic message" })
map("n", "md", function()
  vim.diagnostic.jump { count = 1 }
end, { desc = "Go to next diagnostic message" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
map("n", "<leader>dws", function()
  vim.lsp.buf.workspace_symbol()
end, { desc = "Workspace Symbols" })
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "gr", function()
  require("telescope.builtin").lsp_references()
end, { desc = "References" })
map("n", "<leader>drn", vim.lsp.buf.rename, { desc = "Rename" })

-- CodeCompanion Keymaps (requires 'CodeCompanion.nvim' plugin)
map("n", "<leader>CA", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion actions" })
map("n", "<leader>Co", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CodeCompanion chat toggle" })

map("v", "<leader>CA", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion actions" })
map("v", "<leader>Co", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CodeCompanion chat toggle" })
map("v", "<leader>Ca", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to CodeCompanion chat" })

-- NvimSpectre
map("n", "<leader>S", function()
  require("spectre").toggle()
end, { desc = "Toggle Spectre" })
map("n", "<leader>Sw", function()
  require("spectre").open_visual { select_word = true }
end, { desc = "Spectre visual mode" })
map("v", "<leader>Sw", function()
  require("spectre").open_visual { select_word = true }
end, { desc = "Spectre visual mode" })

--- VimFugitive

map("n", "<leader>gs", vim.cmd.Git)

-- LuaSnip
local ls = require "luasnip"
map({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    return ls.expand_or_jump()
  end
end, { silent = true })

map({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    return ls.jump(-1)
  end
end, { silent = true })

-- Harpoon
local harpoon = require "harpoon"
map("n", "<leader>a", function()
  harpoon:list():add()
end)

map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<F1>", function()
  harpoon:list():select(1)
end)
map("n", "<F2>", function()
  harpoon:list():select(2)
end)
map("n", "<F3>", function()
  harpoon:list():select(3)
end)
map("n", "<F4>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
map("n", "<C-S-N>", function()
  harpoon:list():next()
end)
