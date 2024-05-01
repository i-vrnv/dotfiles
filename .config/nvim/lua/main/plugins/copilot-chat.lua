-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
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
  keys = {
    {
      '<leader>cct',
      function()
        require('CopilotChat').toggle()
      end,
      mode = { 'n', 'x' },
    },
    {
      '<leader>ccq',
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require('CopilotChat').ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end,
      mode = { 'n' },
    },
    {
      '<leader>ccq',
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require('CopilotChat').ask(input, { selection = require("CopilotChat.select").visual })
        end
      end,
      mode = { 'v' },
    },
    {
      '<leader>cch',
      function()
       local actions = require("CopilotChat.actions")
       require('CopilotChat').pick(actions.help_actions())
      end,
      mode = { 'n', 'x' },
    },
    {
      '<leader>ccp',
      function()
       local actions = require("CopilotChat.actions")
       require('CopilotChat').pick(actions.prompt_actions())
      end,
      mode = { 'n', 'x' },
    },
  }
}


