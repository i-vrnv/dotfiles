
local M = {}

function M.setup()

  vim.keymap.set("n", "\\", "<cmd>Neotree float focus reveal toggle<CR>")

  require("neo-tree").setup({
    close_if_last_window = true,
  })
end

return M
