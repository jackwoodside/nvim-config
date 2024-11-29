require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		-- TODO Finalise integrations
		blink_cmp = true,
		mini = {
			enabled = true,
		},
		native_lsp = {
			enabled = true,
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
		noice = true,
	},

	custom_highlights = function(colors)
		return {
			-- Clue
			MiniClueBorder = {
				fg = colors.mantle,
				bg = colors.mantle,
			},
			MiniClueTitle = {
				fg = colors.mantle,
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

			-- Telescope
			-- TelescopeBorder = {
			-- 	fg = colors.mantle,
			-- 	bg = colors.mantle,
			-- },
			--
			-- TelescopePreviewNormal = {
			-- 	fg = colors.text,
			-- 	bg = colors.mantle,
			-- },
			-- TelescopePreviewTitle = {
			-- 	fg = colors.mantle,
			-- 	bg = colors.blue,
			-- },
			--
			-- TelescopeResultsNormal = {
			-- 	fg = colors.text,
			-- 	bg = colors.mantle,
			-- },
			-- TelescopeResultsTitle = {
			-- 	fg = colors.mantle,
			-- 	bg = colors.green,
			-- },
			--
			-- TelescopePromptBorder = {
			-- 	fg = colors.crust,
			-- 	bg = colors.crust,
			-- },
			-- TelescopePromptNormal = {
			-- 	fg = colors.text,
			-- 	bg = colors.crust,
			-- },
			-- TelescopePromptPrefix = {
			-- 	fg = colors.red,
			-- 	bg = colors.crust,
			-- },
			-- TelescopePromptTitle = {
			-- 	fg = colors.crust,
			-- 	bg = colors.red,
			-- },
			--
			-- TelescopeSelectionCaret = {
			-- 	fg = colors.green,
			-- },
		}
	end,
})
