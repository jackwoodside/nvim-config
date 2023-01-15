local map = vim.keymap.set

require("gitsigns").setup({
	signcolumn = false,
	numhl = true,
	on_attach = function(buf)
		local gs = package.loaded.gitsigns
		local opts = { buffer = buf, expr = true, replace_keycodes = false }

		-- Mnemonic is 'g'it

		-- Navigation
		map("n", "]g", [[ &diff ? ']h' : '<CMD>Gitsigns next_hunk<CR>' ]], opts)
		map("n", "[g", [[ &diff ? '[h' : '<CMD>Gitsigns prev_hunk<CR>' ]], opts)

		-- Actions
		map({ "n", "v" }, "<leader>gr", gs.reset_hunk, { buffer = buf })
		map({ "n", "v" }, "<leader>ga", gs.stage_hunk) -- 'g'it 'a'dd
		map("n", "<leader>gp", gs.preview_hunk, { buffer = buf })
	end,
})
