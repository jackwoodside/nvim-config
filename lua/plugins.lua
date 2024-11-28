return require("lazy").setup({
	-- Dependencies
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "nvim-lua/popup.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- LSP

	-- Telescope

	-- Treesitter

	-- Misc.
	---- Theme
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("plugins.catppuccin")
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},

	-- UI Overhaul
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.noice")
		end,
	},
}, {
	colorscheme = { "catppuccin", "habamax" },
	lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
