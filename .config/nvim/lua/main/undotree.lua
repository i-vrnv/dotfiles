local M = {}

function M.setup()
  vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>")
end

return M
