return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    config = function()
      require("rose-pine").setup({
        highlight_groups = {
          ["@constant.builtin"] = { fg = "text", inherit = false, bold = false, italic = false },
          ["@function"] = { fg = "text" },
          ["@function.method"] = { fg = "text" },
          ["@function.builtin"] = { fg = "text", inherit = false, bold = false, italic = false },
          ["@type"] = { fg = "text" },
          ["@variable"] = { fg = "text", inherit = false, bold = false, italic = false },
          ["@variable.parameter"] = { fg = "text", inherit = false, bold = false, italic = false },
          ["@parameter"] = { fg = "rose", inherit = false, bold = false, italic = false },
          ["@property"] = { fg = "text", inherit = false, bold = false, italic = false },
          ["@variable.builtin"] = { fg = "text", inherit = false, bold = false, italic = false },
          Normal = { fg = "text" },  -- Основной текст
          Comment = { fg = "gold", italic = true },  -- Comments: жёлтый italic (как Alabaster)
          String = { fg = "foam" },
          TSString = { fg = "foam" },
          Constant = { fg = "pine" },
          TSConstant = { fg = "pine" },
          Number = { fg = "iris" },
          TSNumber = { fg = "iris" },
          TSBoolean = { fg = "pine" },
          Type = { fg = "text" },
          TSType = { fg = "text" },
          Function = { fg = "text" },
          TSFunction = { fg = "text" },
          TSVariableBuiltin = { fg = "text" },
          Keyword = { fg = "text" },
          TSKeyword = { fg = "text" },
          Include = { fg = "text" },
          TSKeywordFunction = { fg = "text" },
          TSOperator = { fg = "text" },
          TSPunctDelimiter = { fg = "text" },
          TSField = { fg = "text" },
          TSProperty = { fg = "text" },
          Identifier = { fg = "text" },
          -- LSP/UI
          DiagnosticError = { fg = "love" },
          DiagnosticWarn = { fg = "gold" },
          LspDiagnosticsDefaultError = { fg = "love" },

        }
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "p00f/alabaster.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("alabaster")
    end,
  }
}
