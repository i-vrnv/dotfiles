local M = {}

function M.setup()
  require("neogen").setup {
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
      go = {
        template = {
          annotation_convention = "godoc",
        },
      },
      java = {
        template = {
          annotation_convention = "javadoc",
        },
      },
      lua = {
        template = {
          annotation_convention = "ldoc",
        },
      },
      php = {
        template = {
          annotation_convention = "phpdoc",
        },
      },
      python = {
        template = {
          annotation_convention = "google_docstrings",
        },
      },
      rust = {
        template = {
          annotation_convention = "rustdoc",
        },
      },
      javascript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      typescript = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
      typescriptreact = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
    },
  }
end

return M
