local servers = {
  gopls = {
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
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
      },
    },
  },
  phpactor = {},
  kotlin_language_server = {},
  tsserver = {},
}

local function on_attach(client, bufnr)

  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require("main.lsp.keymaps").setup(client, bufnr)
  --require("main.lsp.highlights").setup(client, bufnr)
  --require("main.lsp.formatting").setup(client, bufnr)
end

require("main.lsp.handlers").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities) -- for nvim-cmp
end

local server_opts = {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("mason").setup({
   ui = {
       border = "rounded"
   }
})

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = false,
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
  function(server_name)
    local extended_opts = vim.tbl_deep_extend("force", server_opts, servers[server_name] or {})
    lspconfig[server_name].setup(extended_opts)
  end,
})

