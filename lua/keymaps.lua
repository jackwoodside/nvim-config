local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Black hole mappings
map("n", "c", '"_c')
map("n", "x", '"_x')

-- Change leader to ,
vim.g.mapleader = "<Space>"
vim.g.maplocalleader = "<Space>"

-- Clear search highlighting
map("n", "<esc>", "<CMD>nohlsearch<CR>")

-- Move between splits
map("n", "<A-h>", "<CMD>wincmd h<CR>")
map("n", "<A-j>", "<CMD>wincmd j<CR>")
map("n", "<A-k>", "<CMD>wincmd k<CR>")
map("n", "<A-l>", "<CMD>wincmd l<CR>")

-- Buffer switching
map("n", "<Tab>", "<CMD>bn<CR>")
map("n", "<S-Tab>", "<CMD>bp<CR>")
map("n", "<A-Tab>", "<CMD>bd<CR>")

-- Redo mapping
map("n", "U", "<C-r>")

-- Split paragraphs into sentences
map("n", "<C-s>", "<CMD>s/\\. /.\\r/e<CR><CMD>nohlsearch<CR>")
