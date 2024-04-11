local M = {}

function M.setup()
  local copilot_chat = require("CopilotChat")

  copilot_chat.setup({
    context = 'buffers',
    mappings = {
      complete = {
        detail = 'Use @<Tab> or /<Tab> for options.',
        insert ='<Tab>',
      },
      close = {
        normal = 'q',
        insert = '<C-c>'
      },
      reset = {
        normal ='<C-l>',
        insert = '<C-l>'
      },
      submit_prompt = {
        normal = '<CR>',
        insert = '<C-m>'
      },
      accept_diff = {
        normal = '<C-y>',
        insert = '<C-y>'
      },
      yank_diff = {
        normal = 'gy',
      },
      show_diff = {
        normal = 'gd'
      },
      show_system_prompt = {
        normal = 'gp'
      },
      show_user_selection = {
        normal = 'gs'
      }
    }
  })

  vim.keymap.set("n", "<Leader>ccq", function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
  end, {})

  vim.keymap.set("n", "<Leader>cch", function()
      local actions = require("CopilotChat.actions")
      require("CopilotChat.integrations.telescope").pick(actions.help_actions())
  end, {})

  vim.keymap.set("n", "<Leader>ccp", function()
      local actions = require("CopilotChat.actions")
      require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
  end, {})

end

return M
