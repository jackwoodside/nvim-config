require("noice").setup({
	lsp = {
		override = {
			["cmp.entry.get_documentation"] = true,
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
})
