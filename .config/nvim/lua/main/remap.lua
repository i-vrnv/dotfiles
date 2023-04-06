local default_opts =  {}

vim.g.mapleader = " "

vim.keymap.set("n", "<F1>", "<nop>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>pf", "<cmd>NvimTreeFindFile<CR>")

vim.keymap.set("n", "<leader>s", "<cmd>SymbolsOutline<CR>")

-- Center search results
vim.keymap.set("n", "n", "nzz", default_opts)
vim.keymap.set("n", "N", "Nzz", default_opts)

-- Center up & down scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz", default_opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", default_opts)

-- Copy to system clipboard
vim.keymap.set("x", "<leader>y",'"*y', default_opts)

-- Better indent
vim.keymap.set("v", "<", "<gv", default_opts)
vim.keymap.set("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dP', default_opts)

-- Switch buffer
vim.keymap.set("n", "]b", ":bn<CR>", default_opts)
vim.keymap.set("n", "[b", ":bp<CR>", default_opts)
vim.keymap.set("n", "<leader>x", ":bd<CR>", default_opts)

-- Bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", default_opts)
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", default_opts)
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", default_opts)

-- Cancel search highlighting with ESC
vim.keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", default_opts)
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
vim.keymap.set("n", "<Left>", ":vertical resize +1<CR>", default_opts)
vim.keymap.set("n", "<Right>", ":vertical resize -1<CR>", default_opts)
vim.keymap.set("n", "<Up>", ":resize -1<CR>", default_opts)
vim.keymap.set("n", "<Down>", ":resize +1<CR>", default_opts)

-- Cancel search highlighting with ESC
vim.keymap.set("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", default_opts)
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", default_opts)
