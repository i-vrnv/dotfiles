return {
  'ray-x/go.nvim',
  dependencies = {
    'ray-x/guihua.lua'
  },
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  config = function()
    require('go').setup({
      lsp_codelens = false,
    })
  end,
  enabled = true
}
