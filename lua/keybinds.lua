local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Change leader to ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Clear search highlighting
map("n", "<esc>", "<CMD>nohlsearch<CR>")

-- Move between splits
map("n", "<A-h>", "<CMD>wincmd h<CR>")
map("n", "<A-j>", "<CMD>wincmd j<CR>")
map("n", "<A-k>", "<CMD>wincmd k<CR>")
map("n", "<A-l>", "<CMD>wincmd l<CR>")

-- Split paragraphs into sentences
map("n", "<C-s>", "<CMD>s/\\. /.\\r/e<CR><CMD>nohlsearch<CR>")
