local M = {}

function M.setup()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")

  vim.keymap.set("n", "mm", mark.add_file)
  vim.keymap.set("n", "ml", ui.toggle_quick_menu)

  vim.keymap.set("n", "g1", function() ui.nav_file(1) end)
  vim.keymap.set("n", "g2", function() ui.nav_file(2) end)
  vim.keymap.set("n", "g3", function() ui.nav_file(3) end)
  vim.keymap.set("n", "g4", function() ui.nav_file(4) end)
end

return M
