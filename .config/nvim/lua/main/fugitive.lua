local M = {}

function M.setup()
  vim.keymap.set("n", "<leader>vs", ":tab Git<CR>")
end

return M
