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
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
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
			-- Noice
			NoiceCmdlinePopup = {
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorderCmdline = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorderFilter = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorderHelp = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorderIncRename = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorderInput = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorderLua = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupBorderSearch = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NoiceCmdlinePopupTitle = {
				fg = colors.blue,
				bg = colors.mantle,
			},
			NoiceCmdlinePrompt = {
				bg = colors.mantle,
			},

			-- Notify
			NotifyERRORBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NotifyWARNBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NotifyINFOBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NotifyDEBUGBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			NotifyTRACEBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},

			NotifyERRORBody = {
				bg = colors.mantle,
			},
			NotifyWARNBody = {
				bg = colors.mantle,
			},
			NotifyINFOBody = {
				bg = colors.mantle,
			},
			NotifyDEBUGBody = {
				bg = colors.mantle,
			},
			NotifyTRACEBody = {
				bg = colors.mantle,
			},

			-- Telescope
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

			TelescopeSelectionCaret = {
				fg = colors.green,
			},
		}
	end,
})
