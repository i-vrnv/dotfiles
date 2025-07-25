vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50

vim.opt.scrolloff = 8

vim.opt.spelllang = 'en_us'
vim.opt.spell = false

-- This setting will bring borders for all windows in Neovim.
-- Currently, it is commented out because it add borders to all windows, and borders duplicating. 
-- vim.o.winborder = "rounded"
