local M = {}

function M.setup()
  local lsp = require("lsp-zero")

  lsp.preset("recommended")

  lsp.ensure_installed({
    'bashls',
    'gopls',
    'tsserver',
    'lua_ls',
  })

  lsp.configure('lua_ls', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = { enable = false },
      }
    }
  })

  -- keybindings
  lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>l", function() vim.lsp.codelens.run() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    local ok, telescope = pcall(require, "telescope.builtin")
    if ok then
      vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
      vim.keymap.set("n", "gD", telescope.lsp_type_definitions, opts)
      vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
      vim.keymap.set("n", "gr", telescope.lsp_references, opts)
      vim.keymap.set("n", "gI", telescope.lsp_incoming_calls, opts)
      vim.keymap.set("n", "gO", telescope.lsp_outgoing_calls, opts)
      vim.keymap.set("n", "<leader>s", telescope.lsp_document_symbols, opts)
    end
  end)

  lsp.setup()

  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()

  -- autopairs
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  -- boreders
  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noselect,noinsert",
      keyword_length = 1,
    },
    preselect = cmp.PreselectMode.None,
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ['<Tab>'] = cmp_action.luasnip_supertab(),
      ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      ['<C-Space>'] = cmp.mapping.complete(),
    }
  })

  cmp.setup.cmdline({"/", "?"}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  -- inline diagnostic messages
  vim.diagnostic.config({
    virtual_text = true,
  })
end

return M
