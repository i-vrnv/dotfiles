return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {"bash"," go", "gomod", "gowork", "gosum", "lua", "javascript", "typescript"},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    }
  end,
  depndencies = {
    {'nvim-treesitter/nvim-treesitter-context'},
  }
}

