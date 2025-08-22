return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  enabled = false,
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = "copilot",
    providers = {
    --   ["copilot-claude-3.7"] = {
    --     __inherited_from = "copilot",
    --     model = "claude-3.7-sonnet",
    --   },
    --   ["copilot-claude-3.7-thought"] = {
    --     __inherited_from = "copilot",
    --     model = "claude-3.7-sonnet-thought",
    --     extra_request_body = {
    --       temperature = 1,
    --       max_tokens = 20000,
    --     }
    --   },
    --   ["claude-opus"] = {
    --     hide_in_model_selector = true,
    --   },
    --   ["openai-gpt-4o-mini"] = {
    --     hide_in_model_selector = true,
    --   }
    },
    windows = {
      ask = {
        border = "rounded",
      },
      edit = {
        border = "rounded",
      },
      width = 50,
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
    -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
