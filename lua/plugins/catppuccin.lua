require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		cmp = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
		gitsigns = true,
		indent_blankline = {
			enabled = true,
		},
		leap = true,
		mason = true,
		mini = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		noice = true,
		notify = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		which_key = true,
	},
	custom_highlights = function(colors)
		return {
			TelescopeBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},

			TelescopePreviewNormal = {
				fg = colors.text,
				bg = colors.mantle,
			},
			TelescopePreviewTitle = {
				fg = colors.mantle,
				bg = colors.blue,
			},

			TelescopeResultsNormal = {
				fg = colors.text,
				bg = colors.mantle,
			},
			TelescopeResultsTitle = {
				fg = colors.mantle,
				bg = colors.green,
			},

			TelescopePromptBorder = {
				fg = colors.crust,
				bg = colors.crust,
			},
			TelescopePromptNormal = {
				fg = colors.text,
				bg = colors.crust,
			},
			TelescopePromptPrefix = {
				fg = colors.red,
				bg = colors.crust,
			},
			TelescopePromptTitle = {
				fg = colors.crust,
				bg = colors.red,
			},
		}
	end,
})
