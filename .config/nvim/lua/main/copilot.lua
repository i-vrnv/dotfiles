local M = {}

function M.setup()
  require('copilot').setup({})
  require('copilot_cmp').setup()
end

return M
