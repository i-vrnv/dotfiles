local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'go', 'lua', 'python', 'rust', 'typescript', 'help' },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = { 'python' }
    },
  }
end

return M
