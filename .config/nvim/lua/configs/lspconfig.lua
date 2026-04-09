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
  -- Support for mono repos
  root_dir = function(bufnr, on_dir)
    -- The project root is where the LSP can be started from. Get this by lockfiles or .git directory.
    local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
    root_markers = vim.list_extend(root_markers, { ".git" })
    local project_root = vim.fs.root(bufnr, root_markers)
    -- We fallback to the current working directory if no project root is found
    local project_root_with_fallback = project_root or vim.fn.getcwd()

    on_dir(project_root_with_fallback)
  end,
})

vim.lsp.enable "eslint"

vim.lsp.config("ts_ls", {
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "project-relative",
    },
  },
})

-- C# / .NET (csharp-ls works with .NET 8+; OmniSharp v1.39 breaks with .NET 10 SDK)
vim.lsp.enable "csharp_ls"

-- Go
-- vim.lsp.config("gopls", {
--   -- capabilities = capabilities,
--   -- on_attach = on_attach,
--   cmd = { "gopls" },
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   -- root_dir = vim.lsp.util.root_pattern("go.work", "go.mod", ".git"),
-- })
