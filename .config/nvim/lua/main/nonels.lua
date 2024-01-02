local M = {}

function M.setup()
  local nls = require("null-ls")
  local composer_global_dir = vim.fn.expand("$HOME/.composer")
  local composer_global_bin_dir = composer_global_dir .. "/vendor/bin"

  local php = {
      nls.builtins.formatting.phpcsfixer.with({
        command = composer_global_bin_dir .. "/php-cs-fixer",
        extra_args = {
          "--config",
          composer_global_dir .. "/.php_cs_fixer.php",
        },
      }),
      nls.builtins.diagnostics.phpstan.with({
        command = composer_global_bin_dir .. "/phpstan",
        extra_args = { "-l", "max" },
      }),
    }

  nls.register(php)
end

return M
