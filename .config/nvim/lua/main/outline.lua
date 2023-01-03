local M = {}

function M.setup()
  vim.keymap.set("n", "<leader>s", ":SymbolsOutline<CR>")

  require("symbols-outline").setup({
    auto_close = true,
    highlight_hovered_item = true,
  })
end

return M
