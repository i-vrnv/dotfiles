
local M = {}

function M.setup()

  local builtin = require('neo-tree.command')
  vim.keymap.set("n", "\\", function() builtin.execute({ toggle = true, reveal = true }) end )

  require("neo-tree").setup({
    close_if_last_window = true,
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
         builtin.execute({ action = "close" })
        end
      },
    },
  })
end

return M
