require("codecompanion").setup {
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true,
      },
    },
  },
  strategies = {
    chat = {
      adapter = "ollama",
    },
    inline = {
      adapter = "ollama",
    },
  },
  adapters = {
    llama3 = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "llama3",
        schema = {
          model = {
            default = "llama3:latest",
          },
          num_ctx = {
            default = 16384,
          },
        },
      })
    end,
  },
  display = {
    action_palette = {
      opts = {
        -- show_default_prompt_library = false,
      },
    },
  },
  prompt_library = {
    ["Generate a Commit Message"] = {
      strategy = "chat",
      description = "Generate a commit message",
      opts = {
        index = 10,
        is_default = true,
        is_slash_cmd = true,
        short_name = "commit",
        auto_submit = true,
      },
      prompts = {
        {
          role = "user",
          content = function()
            return string.format(
              [[You are an expert at following the Conventional Commit specification with one difference from the standard. In the standard the message starts with:

<type>[optional scope]: <description>

Skip the '<type>[optional scope]:' part and start directly with the <description> and continue to <body>, if you see that additional explanation is needed.

Given the git diff listed below, please generate a commit message for me and just respond with the message:

```diff
%s
```
]],
              vim.fn.system "git diff --no-ext-diff --staged"
            )
          end,
          opts = {
            contains_code = true,
          },
        },
      },
    },
  },
}

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd [[cab cc CodeCompanion]]
