-- NVChad sets up lua by default
require("nvchad.configs.lspconfig").defaults()

local augroup = vim.api.nvim_create_augroup("lint", {})

-- Eslint
vim.lsp.config("eslint", {
  -- flags = { debounce_text_changes = 500 },
  -- Setup autofixing on save
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
})

vim.lsp.enable "eslint"

-- Go
-- vim.lsp.config("gopls", {
--   -- capabilities = capabilities,
--   -- on_attach = on_attach,
--   cmd = { "gopls" },
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   -- root_dir = vim.lsp.util.root_pattern("go.work", "go.mod", ".git"),
-- })
