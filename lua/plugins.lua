-- TODO check all events
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
	--- Mini Extras
	{
		"echasnovski/mini.extra",
		event = "VeryLazy",
		config = function()
			require("mini.extra").setup()
		end,
	},

	{
		"echasnovski/mini.icons",
		event = "VeryLazy",
		config = function()
			require("mini.icons").setup()
		end,
	},

	--- Alignment
	{
		"echasnovski/mini.align",
		event = "VeryLazy",
		config = function()
			require("mini.align").setup()
		end,
	},

	--- Comments
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("plugins.comment")
		end,
	},

	--- Diffs
	{
		"echasnovski/mini.diff",
		event = "VeryLazy",
		config = function()
			require("plugins.diff")
		end,
	},

	--- File Browser
	{
		"echasnovski/mini.files",
		lazy = false,
		config = function()
			require("plugins.files")
		end,
	},

	--- Finder
	{
		"echasnovski/mini.pick",
		config = function()
			require("plugins.pick")
		end,
	},

	--- Folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("plugins.ufo")
		end,
	},

	--- Git
	{
		"echasnovski/mini-git",
		config = function()
			require("plugins.git")
		end,
	},

	--- Highlights
	{
		"echasnovski/mini.hipatterns",
		config = function()
			require("plugins.highlights")
		end,
	},

	--- Indents
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("plugins.indents")
		end,
	},

	--- Keymaps
	{
		"echasnovski/mini.clue",
		event = "VeryLazy",
		config = function()
			require("plugins.clue")
		end,
	},

	--- Moving
	{
		"echasnovski/mini.move",
		event = "VeryLazy",
		config = function()
			require("plugins.move")
		end,
	},

	--- Notifications
	{
		"echasnovski/mini.notify",
		event = "VeryLazy",
		config = function()
			require("plugins.notify")
		end,
	},

	--- Statusline
	{
		"echasnovski/mini.statusline",
		config = function()
			require("plugins.statusline")
		end,
	},

	--- Surroundings
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("plugins.pairs")
		end,
	},

	--- Tabline
	{
		"echasnovski/mini.tabline",
		config = function()
			require("plugins.tabline")
		end,
	},

	--- Textobjects
	{
		"echasnovski/mini.ai",
		config = function()
			require("plugins.ai")
		end,
	},

	--- Theme
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

	--- UI Overhaul
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
