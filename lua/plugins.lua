return require("lazy").setup({
	-- Dependencies
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "nvim-lua/popup.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- LSP
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.language.lsp")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.language.null-ls")
		end,
	},

	{
		"saghen/blink.cmp",
		lazy = false,
		version = "v0.*",
		config = function()
			require("plugins.language.cmp")
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VimEnter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "nvim-treesitter/nvim-treesitter-refactor" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	},
	-- Misc.
	---- Comments
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("plugins.comment")
		end,
	},

	---- Diffs
	{
		"echasnovski/mini.diff",
		event = "VeryLazy",
		config = function()
			require("plugins.diff")
		end,
	},

	---- File Browser
	{
		"echasnovski/mini.files",
		lazy = false,
		config = function()
			require("plugins.files")
		end,
	},

	---- Finder
	{
		"echasnovski/mini.pick",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("plugins.pick")
		end,
	},

	----Folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("plugins.ufo")
		end,
	},

	---- Statusline
	{
		"echasnovski/mini.statusline",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("plugins.statusline")
		end,
	},

	---- Surroundings
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("plugins.pairs")
		end,
	},

	---- Tabline
	{
		"echasnovski/mini.tabline",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("plugins.tabline")
		end,
	},

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

	---- UI Overhaul
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.noice")
		end,
	},
}, {
	colorscheme = { "catppuccin" },
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
