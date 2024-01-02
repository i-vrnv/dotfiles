local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {"bash"," go", "java", "php", "phpdoc", "lua", "rust", "javascript", "typescript"},
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
end

return M
