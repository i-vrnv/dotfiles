-- https://github.com/nvim-lualine/lualine.nvim
return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  config = function()
    require('lualine').setup {
      options = {
--        theme = 'tokyonight',
        section_separators = '',
        component_separators = ''
      }
    }
  end,
}

