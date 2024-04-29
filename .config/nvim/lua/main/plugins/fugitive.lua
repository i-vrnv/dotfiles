return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set("n", "<leader>vs", ":tab Git<CR>")
  end,
}
