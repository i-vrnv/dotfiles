vim.api.nvim_create_user_command('Format', ':%!jq .', {})
vim.api.nvim_create_user_command('Unformat', ':%!jq -c .', {})
