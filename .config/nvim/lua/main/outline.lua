local M = {}

local remap = require("main.keymap")
local nnoremap = remap.nnoremap

function M.setup()
  nnoremap("<leader>s", ":SymbolsOutline<CR>")

  require("symbols-outline").setup({
    auto_close = true,
  })
end

return M
