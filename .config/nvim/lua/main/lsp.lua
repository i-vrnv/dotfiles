local M = {}

function M.setup()
  local lsp = require("lsp-zero")

  lsp.preset("recommended")

  lsp.ensure_installed({
    'tsserver',
    'sumneko_lua',
  })

  lsp.configure('sumneko_lua', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = { enable = false },
      }
    }
  })

  local cmp = require('cmp')

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  -- boreders
  local cmp_config = lsp.defaults.cmp_config({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    }
  })

  cmp.setup(cmp_config)

  lsp.setup_nvim_cmp({
    preselect = cmp.PreselectMode.None
  })

  -- keybindings
  lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

    local ok, telescope = pcall(require, "telescope.builtin")
    if ok then
      vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
      vim.keymap.set("n", "gD", telescope.lsp_type_definitions, opts)
      vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
      vim.keymap.set("n", "gr", telescope.lsp_references, opts)
      vim.keymap.set("n", "gI", telescope.lsp_incoming_calls, opts)
      vim.keymap.set("n", "gO", telescope.lsp_outgoing_calls, opts)
    end
  end)

  lsp.setup()

  -- inline diagnostic messages
  vim.diagnostic.config({
    virtual_text = true,
  })
end

return M
