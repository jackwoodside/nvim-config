-- Reconfigure
require("noice").setup({
	cmdline = {
		enabled = true,
		format = {
			cmdline = { pattern = "^:", icon = "❯", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			lua = {
				pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
				icon = "",
				title = " Lua Command ",
				lang = "lua",
			},
		},
		view = "cmdline_popup",
	},

	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},

	-- Hidden notifications
	routes = {
		{ filter = { event = "msg_show", find = "B written" }, skip = true },
		{ filter = { event = "msg_show", find = "clipboard: No provider" }, skip = true },
		{ filter = { event = "notify.info", find = "Format request failed" }, skip = true },
		{ filter = { event = "msg_show", find = "search hit" }, skip = true },
		{ filter = { event = "msg_show", find = "Workspace edit" }, skip = true },
	},
})
