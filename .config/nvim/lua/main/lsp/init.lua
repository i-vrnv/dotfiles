local M = {}

local lspconfig = require("lspconfig")

local servers = {
    gopls = {},
    jdtls = {},
} 

function M.on_attach(client, bufnr)

  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require("main.lsp.handlers").setup()
  require("main.lsp.keymaps").setup()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) -- for nvim-cmp

function M.setup()
    lspconfig.gopls.setup{
        cmd = {'gopls'},
        -- for postfix snippets and analyzers
        capabilities = M.capabilities,
        settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
            },
        },
        on_attach = M.on_attach,
    }
end

return M
