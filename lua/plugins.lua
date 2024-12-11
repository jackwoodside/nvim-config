-- TODO check all events
-- TODO leap
-- TODO statuscolumn
-- TODO toggleterm
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
		event = { "BufReadPre", "BufNewFile" },
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
		event = { "BufReadPre", "BufNewFile" },
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

	--- Animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			require("mini.animate").setup()
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
		event = "VeryLazy",
		config = function()
			require("plugins.files")
		end,
	},

	--- Finder
	{
		"echasnovski/mini.pick",
		event = "VeryLazy",
		config = function()
			require("plugins.pick")
		end,
	},

	--- Folding
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("plugins.ufo")
		end,
	},

	--- Git
	{
		"echasnovski/mini-git",
		event = "VeryLazy",
		config = function()
			require("plugins.git")
		end,
	},

	--- Highlights
	{
		"echasnovski/mini.hipatterns",
		event = "VeryLazy",
		config = function()
			require("plugins.highlights")
		end,
	},

	--- Indents
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
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

	--- Startscreen
	{
		"echasnovski/mini.starter",
		event = "VimEnter",
		config = function()
			require("plugins.starter")
		end,
	},

	--- Statusline
	{
		"echasnovski/mini.statusline",
		event = "VeryLazy",
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

	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function()
			require("plugins.surround")
		end,
	},

	--- Tabline
	{
		"echasnovski/mini.tabline",
		event = "VeryLazy",
		config = function()
			require("plugins.tabline")
		end,
	},

	--- Textobjects
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
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
