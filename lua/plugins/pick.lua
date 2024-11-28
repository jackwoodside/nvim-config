require("mini.pick").setup({
	-- TODO configure
})

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader>fb", "<CMD>Pick buffers<CR>")
map("n", "<leader>ff", "<CMD>Pick files<CR>")
