local keymap = require("main.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local xnoremap = keymap.xnoremap

local default_opts = { noremap = true, silent = true }

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- Center search results
nnoremap("n", "nzz", default_opts)
nnoremap("N", "Nzz", default_opts)

-- Center up & down scrolling
nnoremap("<C-u>", "<C-u>zz", default_opts)
nnoremap("<C-d>", "<C-d>zz", default_opts)

-- Better indent
vnoremap("<", "<gv", default_opts)
vnoremap(">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
vnoremap("p", '"_dP', default_opts)

-- Switch buffer
nnoremap("]b", ":bn<CR>", default_opts)
nnoremap("[b", ":bp<CR>", default_opts)

-- Bufferline
nnoremap("<Tab>", ":BufferLineCycleNext<CR>", default_opts)
nnoremap("<S-Tab>", ":BufferLineCyclePrev<CR>", default_opts)

-- Cancel search highlighting with ESC
nnoremap("<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
xnoremap("K", ":move '<-2<CR>gv-gv", default_opts)
xnoremap("J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
nnoremap("<Left>", ":vertical resize +1<CR>", default_opts)
nnoremap("<Right>", ":vertical resize -1<CR>", default_opts)
nnoremap("<Up>", ":resize -1<CR>", default_opts)
nnoremap("<Down>", ":resize +1<CR>", default_opts)
