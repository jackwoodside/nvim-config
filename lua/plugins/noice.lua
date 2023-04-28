require("noice").setup({
	lsp = {
		override = {
			["cmp.entry.get_documentation"] = true,
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},

	-- Hidden notifications
	routes = {
		{ filter = { event = "msg_show", find = "B written" }, skip = true },
		{ filter = { event = "msg_show", find = "clipboard: No provider" }, skip = true },
		{ filter = { event = "msg_show", find = "Macro Recording" }, skip = true },
		{ filter = { event = "msg_show", find = "search hit" }, skip = true },
		{ filter = { event = "msg_show", find = "Workspace edit" }, skip = true },
	},
})
