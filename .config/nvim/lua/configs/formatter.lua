local options = {
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
    python = { "isort", "black" },
    go = { "gofumpt", "goimports-reviser" },
  },
  format_on_save = {
    lsp_fallback = false,
    async = false,
    timeout_ms = 1000,
  },
}

return options
