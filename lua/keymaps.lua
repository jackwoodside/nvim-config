local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Black hole mappings
map("n", "c", '"_c')
map("n", "x", '"_x')

-- Change leader to space
map("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlighting
map("n", "<esc>", "<CMD>nohlsearch<CR>")

-- Move between splits
map("n", "<C-h>", "<CMD>wincmd h<CR>")
map("n", "<C-j>", "<CMD>wincmd j<CR>")
map("n", "<C-k>", "<CMD>wincmd k<CR>")
map("n", "<C-l>", "<CMD>wincmd l<CR>")

-- Buffer switching
map("n", "<Tab>", "<CMD>bn<CR>")
map("n", "<S-Tab>", "<CMD>bp<CR>")
map("n", "<A-Tab>", "<CMD>bd<CR>")

-- Redo mapping
map("n", "U", "<C-r>")

-- Split paragraphs into sentences
map("n", "<C-s>", "<CMD>s/\\. /.\\r/e<CR><CMD>nohlsearch<CR>")
