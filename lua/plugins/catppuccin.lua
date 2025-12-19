require("catppuccin").setup({
	flavour = "mocha",
	auto_integrations = true,
	integrations = {
		native_lsp = {
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
	},

	custom_highlights = function(colors)
		return {
			-- Clue
			MiniClueBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			MiniClueTitle = {
				fg = colors.text,
				bg = colors.mantle,
			},

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
				fg = colors.mantle,
				bg = colors.blue,
			},
			NoiceCmdlinePrompt = {
				bg = colors.mantle,
			},

			-- Tabline
			MiniTablineCurrent = {
				fg = colors.text,
				bg = colors.surface0,
				style = { "bold" },
			},
			MiniTablineModifiedCurrent = {
				fg = colors.text,
				bg = colors.surface0,
				style = { "bold" },
			},
			MiniTablineModifiedVisible = {
				fg = colors.text,
				style = {},
			},
		}
	end,
})
