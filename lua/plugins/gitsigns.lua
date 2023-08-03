local function map(m, k, v, b, d)
	vim.keymap.set(m, k, v, { buffer = b, desc = d, silent = true })
end

require("gitsigns").setup({
	signs = {
		changedelete = { text = "┃" },
	},

	on_attach = function(buf)
		local gs = package.loaded.gitsigns

		-- Actions
		map({ "n", "v" }, "<leader>ga", gs.stage_hunk, buf, "Add hunk")
		map({ "n", "v" }, "<leader>gA", gs.stage_buffer, buf, "Add buffer")
		map({ "n", "v" }, "<leader>gr", gs.reset_hunk, buf, "Reset hunk")
		map({ "n", "v" }, "<leader>gp", gs.preview_hunk, buf, "Preview hunk")

		-- Navigation
		map("n", "]g", gs.next_hunk, buf, "Next hunk")
		map("n", "[g", gs.prev_hunk, buf, "Previous hunk")
	end,
})
