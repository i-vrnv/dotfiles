local M = {}

function M.setup(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    local function format()
      local view = vim.fn.winsaveview()
      vim.lsp.buf.format({
        async = true,
        filter = function(attached_client)
          return attached_client.name ~= ""
        end,
      })
      vim.fn.winrestview(view)
    end

    local lsp_format_grp = vim.api.nvim_create_augroup("LspFormat", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.schedule(format)
      end,
      group = lsp_format_grp,
      buffer = bufnr,
    })
  end
end

return M
