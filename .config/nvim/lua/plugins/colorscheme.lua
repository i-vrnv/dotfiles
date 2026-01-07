return {
  {'folke/tokyonight.nvim'},
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    config = function()
      require("catppuccin").setup({
        auto_integrations = true,
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose_pine',
  },
  {
    "ellisonleao/gruvbox.nvim"
  },
  {
  "p00f/alabaster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("alabaster")
  end,
}
}
