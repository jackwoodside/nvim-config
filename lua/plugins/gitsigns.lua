local map = vim.keymap.set

require("gitsigns").setup({
	signs = {
		changedelete = { text = "┃" },
	},

	on_attach = function(buf)
		local gs = package.loaded.gitsigns

		-- Mnemonic is 'g'it

		-- Navigation
		map(
			"n",
			"]g",
			[[ &diff ? ']h' : '<CMD>Gitsigns next_hunk<CR>' ]],
			{ buffer = buf, desc = "Next hunk", expr = true, replace_keycodes = false }
		)
		map(
			"n",
			"[g",
			[[ &diff ? '[h' : '<CMD>Gitsigns prev_hunk<CR>' ]],
			{ buffer = buf, desc = "Previous hunk", expr = true, replace_keycodes = false }
		)

		-- Actions
		map({ "n", "v" }, "<leader>gr", gs.reset_hunk, { buffer = buf, desc = "Reset hunk" })
		map({ "n", "v" }, "<leader>ga", gs.stage_hunk, { buffer = buf, desc = "Add hunk" })
		map("n", "<leader>gp", gs.preview_hunk, { buffer = buf, desc = "Preview hunk" })
	end,
})
