return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
  keys = {
    {
      "<leader>ra",
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
      mode = { "n", "x" },
    },
    {
      "<leader>iv",
      function()
        require('refactoring').refactor('Extract Variable')
      end,
      mode = { "n", "x" },
    },
  },
}
