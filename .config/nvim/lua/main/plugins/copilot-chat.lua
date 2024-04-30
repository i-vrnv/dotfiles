-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  opts = {
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
  },
  config = function()
    local copilot_chat = require("CopilotChat")

    -- Toggle the chat window
    vim.keymap.set("n", "<Leader>cct", function()
      copilot_chat.toggle()
    end, {})

    -- Ask a question for the current buffer
    vim.keymap.set("n", "<Leader>ccq", function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        copilot_chat.ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end, {})

    -- Ask a question for selection in the current buffer
    vim.keymap.set("v", "<Leader>ccq", function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        copilot_chat.ask(input, { selection = require("CopilotChat.select").visual })
      end
    end, {})

    vim.keymap.set("n", "<Leader>cch", function()
      local actions = require("CopilotChat.actions")
      copilot_chat.pick(actions.help_actions())
    end, {})

    vim.keymap.set("n", "<Leader>ccp", function()
      local actions = require("CopilotChat.actions")
      copilot_chat.pick(actions.prompt_actions())
    end, {})

  end,
}


