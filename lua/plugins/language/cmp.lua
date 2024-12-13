local blink = require("blink.cmp")
blink.setup({
	completion = {
		accept = {
			auto_brackets = {
				enabled = true,
			},
		},

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 1000,
			update_delay_ms = 0,
			treesitter_highlighting = true,
		},

		ghost_text = {
			enabled = true,
		},

		list = {
			selection = "auto_insert",
		},

		menu = {
			draw = {
				columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } },
			},
		},
	},

	keymap = {
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<C-space>"] = { "select_and_accept" },
		["<C-BS>"] = { "cancel" },

		["<C-h>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
		["<PageUp>"] = { "scroll_documentation_up", "fallback" },
		["<PageDown>"] = { "scroll_documentation_down", "fallback" },

		["<C-j>"] = { "snippet_forward" },
		["<C-k>"] = { "snippet_backward" },
	},

	signature = {
		enabled = true,
	},
})
