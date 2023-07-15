local M = {}

function M.setup()
  -- moved to remap.lua becouse neogit has status `not loaded` and config doesn't apply
  --vim.keymap.set("n", "<leader>G", ":lua require('neogit').open()<CR>")

  local neogit = require("neogit")
  neogit.setup {
    integrations = {
      diffview = true
    },
  }
end

return M
