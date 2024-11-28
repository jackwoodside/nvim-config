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
		},

		ghost_text = {
			enabled = true,
		},

		list = {
			selection = "auto_insert",
		},

		menu = {
			draw = {
				columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
			},
		},
	},

	keymap = {
		preset = "default",

		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },

		["<C-j>"] = { "snippet_forward", "fallback" },
		["<C-k>"] = { "snippet_backward", "fallback" },

		["<C-Space>"] = { "select_and_accept", "fallback" },

		["<C-PageUp>"] = { "scroll_documentation_up", "fallback" },
		["<C-PageDown>"] = { "scroll_documentation_down", "fallback" },
	},

	signature = {
		enabled = true,
	},

	sources = {
		completion = {
			enabled_providers = { "snippets", "lsp", "path", "buffer" },
		},

		providers = {
			lsp = {
				name = "LSP",
				module = "blink.cmp.sources.lsp",

				min_keyword_length = 2,
			},

			path = {
				name = "Path",
				module = "blink.cmp.sources.path",

				min_keyword_length = 2,
				score_offset = 3,
				opts = {
					trailing_slash = false,
					label_trailing_slash = true,
					get_cwd = function(context)
						return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
					end,
					show_hidden_files_by_default = false,
				},
			},

			snippets = {
				name = "Snippets",
				module = "blink.cmp.sources.snippets",

				min_keyword_length = 2,
				score_offset = -3,
				opts = {
					friendly_snippets = true,
					search_paths = { vim.fn.stdpath("config") .. "/snippets" },
					global_snippets = { "all" },
					extended_filetypes = {},
					ignored_filetypes = {},
					get_filetype = function(context)
						return vim.bo.filetype
					end,
				},
			},
			buffer = {
				name = "Buffer",
				module = "blink.cmp.sources.buffer",

				min_keyword_length = 2,
				fallback_for = { "lsp" },
			},
		},
	},
})
