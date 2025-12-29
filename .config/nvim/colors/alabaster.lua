vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end
vim.g.colors_name = 'alabaster'

local highlights = {
  Normal = { fg = '#000000', bg = '#F7F7F7' },
  Comment = { fg = '#AA3731' },
  String = { fg = '#448C27' },
  Number = { fg = '#7A3E9D' },
  Constant = { fg = '#7A3E9D' },
  Identifier = { fg = '#325CC0' },
  Function = { fg = '#325CC0' },
  Statement = { fg = '#325CC0' },
  Type = { fg = '#325CC0' },
  Special = { fg = '#777777' },
  Error = { fg = '#660000', bg = '#FFDDDD' },
  CursorLine = { bg = '#F0F0F0' },
  LineNr = { fg = '#9DA39A' },
  Cursor = { fg = '#007ACC' },
  Visual = { bg = '#BFDBFE' },
  Search = { bg = '#FFBC5D' },
  IncSearch = { bg = '#FFD863' },
  StatusLine = { bg = '#DDDDDD', fg = '#474747' },
  StatusLineNC = { bg = '#DDDDDD', fg = '#474747' },
  DiffAdd = { bg = '#DDFFDD', fg = '#434343' },
  DiffDelete = { bg = '#FFDDDD', fg = '#434343' },
  DiffChange = { bg = '#DDDDFF', fg = '#434343' },
  Pmenu = { bg = '#F0F0F0' },
  PmenuSel = { bg = '#DDDDDD', fg = '#000000' },
  VertSplit = { fg = '#CCCCCC' },
  SignColumn = { bg = '#F7F7F7' },
  Folded = { bg = '#F0F0F0', fg = '#777777' },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Terminal colors
vim.g.terminal_color_0 = '#000000'
vim.g.terminal_color_1 = '#AA3731'
vim.g.terminal_color_2 = '#448C27'
vim.g.terminal_color_3 = '#CB9000'
vim.g.terminal_color_4 = '#325CC0'
vim.g.terminal_color_5 = '#7A3E9D'
vim.g.terminal_color_6 = '#0083B2'
vim.g.terminal_color_7 = '#BBBBBB'
vim.g.terminal_color_8 = '#777777'
vim.g.terminal_color_9 = '#F05050'
vim.g.terminal_color_10 = '#60CB00'
vim.g.terminal_color_11 = '#FFBC5D'
vim.g.terminal_color_12 = '#007ACC'
vim.g.terminal_color_13 = '#E64CE6'
vim.g.terminal_color_14 = '#00AACB'
vim.g.terminal_color_15 = '#FFFFFF'