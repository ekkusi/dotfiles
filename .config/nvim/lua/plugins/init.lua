return {
  "nvim-lua/plenary.nvim",
  {
    "nvchad/ui",
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      return require "configs.formatter"
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "cssls",
        "tailwindcss",
        "prismals",
        "dockerls",
        "graphql",
        "eslint",
        "lua_ls",
        "csharp_ls",
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ensure_installed = {
            "prettierd",
            "stylua",
            "isort",
            "black",
            "gofumpt",
            "goimports-reviser",
            "ktlint",
            "eslint_d",
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      require "configs.lspconfig"
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require "configs.typescript-tools"
    end,
  },
  -- {
  --   "neoclide/coc.nvim",
  --   event = { "BufReadPost", "BufNewFile" },
  --   branch = "release",
  -- },
  -- {
  --   "hrsh4th/nvim-cmp",
  --   enabled = false,
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return require "configs.treesitter"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require "configs.LuaSnip"
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local opts = require "configs.nvimtree"
      -- require(" ode").load()
      return opts
    end,
  },

  "nvim-telescope/telescope-ui-select.nvim",
  "fannheyward/telescope-coc.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable "make" == 1
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {},
    opts = function(_, conf)
      conf.extensions = {
        ["ui-select"] = require("telescope.themes").get_dropdown {},
        ["coc"] = {
          prefer_locations = true,
          push_cursor_on_edit = true,
          timeout = 3000,
        },
      }
      conf.extensions_list = {
        "ui-select",
        "fzf",
        "coc",
      }
      local telescope = require "telescope"
      for _, ext in ipairs(conf.extensions_list) do
        telescope.load_extension(ext)
      end
      return conf
    end,
  },
  {
    "Hiphish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.rainbowdelimiters"
    end,
  },
  "JoosepAlviste/nvim-ts-context-commentstring",
  {
    "numToStr/Comment.nvim",
    opts = function()
      return require "configs.comment"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "itchyny/vim-qfedit",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "ThePrimeagen/harpoon",
    event = "User FilePost",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.harpoon"
    end,
  },
  -- {
  --   "github/copilot.vim",
  --   event = { "BufReadPre", "BufNewFile" },
  -- },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "github/copilot.vim",
  --     "ravitemer/mcphub.nvim",
  --   },
  --   config = function()
  --     require "configs.codecompanion"
  --   end,
  -- },
  -- {
  --   "ravitemer/mcphub.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   build = "npm install -g mcp-hub@latest",
  --   config = function()
  --     require("mcphub").setup()
  --   end,
  -- },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require "configs.minuet-ai"
  --   end,
  -- },
}
