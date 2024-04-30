-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local builtin = require('neo-tree.command')
    vim.keymap.set("n", "\\", function() builtin.execute({ toggle = true, reveal = true }) end )

    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function(_)
            builtin.execute({ action = "close" })
          end
        },
      },
    })
  end,
}
