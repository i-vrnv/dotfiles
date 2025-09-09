return {
  'echasnovski/mini.comment',
  branch = 'stable',
  config = function()
    require('mini.comment').setup {
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = '<C-_>', -- it's actually <C-/>  

        -- Toggle comment on current line
        --comment_line = '<C-_>',

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = '<C-_>',
      },
    }
  end,
}

