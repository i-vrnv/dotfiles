return {
  {'folke/tokyonight.nvim'},
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
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
  { "ellisonleao/gruvbox.nvim"}
}
