require("mini.comment").setup({
	options = {
		custom_commentstring = function()
			return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
		end,
	},

	mappings = {
		comment = "<leader>lc",
		comment_line = "<leader>lcc",
		comment_visual = "<leader>lc",
		textobject = "",
	},
})
