local M = {}

M.setup = function()
    -- перенести в общий конфиг lsp
  local icons = require "main.icons"
  local signs = {

    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- LSP handlers configuration
  local config = {
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },

    diagnostic = {
      -- virtual_text = false,
      -- virtual_text = { spacing = 4, prefix = "●" },
      virtual_text = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        active = signs,
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
  }

  -- Diagnostic configuration
  vim.diagnostic.config(config.diagnostic)

  -- Hover configuration
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)

  -- Signature help configuration
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

M.on_attach = function(client, bufnr)

  if client.name == "tsserver" then
    require("lsp-inlayhints").on_attach(client, bufnr)
  end

  if client.name == "jdt.ls" then
    -- vim.lsp.codelens.refresh()
    if JAVA_DAP_ACTIVE then
      require("jdtls").setup_dap { hotcodereplace = "auto" }
      require("jdtls.dap").setup_dap_main_class_configs()
    end
  end
end

--function M.enable_format_on_save()
--  vim.cmd [[
--    augroup format_on_save
--      autocmd! 
--      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false }) 
--    augroup end
--  ]]
--  vim.notify "Enabled format on save"
--end
--
--function M.disable_format_on_save()
--  M.remove_augroup "format_on_save"
--  vim.notify "Disabled format on save"
--end
--
--function M.toggle_format_on_save()
--  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
--    M.enable_format_on_save()
--  else
--    M.disable_format_on_save()
--  end
--end
--
--function M.remove_augroup(name)
--  if vim.fn.exists("#" .. name) == 1 then
--    vim.cmd("au! " .. name)
--  end
--end

-- vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]]

return M
