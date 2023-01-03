local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {"bash"," go", "java", "php", "phpdoc", "lua", "rust"},
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "python", "java", "rust", "lua" } },
  }
end

return M
