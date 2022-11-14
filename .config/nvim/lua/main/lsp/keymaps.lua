local M = {}

local remap = require("main.keymap")
local nnoremap = remap.nnoremap

M.setup = function(_, bufnr)
  local opts = { noremap = true, silent = true }

  nnoremap('<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  nnoremap('<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  nnoremap('<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  nnoremap('<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  nnoremap('<leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
  nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  nnoremap('<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  nnoremap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  nnoremap('<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  nnoremap('<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  nnoremap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  nnoremap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- nnoremap('<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

return M
