-- Bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

return require("lazy").setup({
	-- Dependencies
	require("plugins.dependencies"),

	-- Language Tools
	require("plugins.language"),

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.telescope")
		end,
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					---@diagnostic disable-next-line: different-requires
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				config = function()
					---@diagnostic disable-next-line: different-requires
					require("telescope").load_extension("live_grep_args")
				end,
			},
			{
				"nvim-telescope/telescope-media-files.nvim",
				config = function()
					---@diagnostic disable-next-line: different-requires
					require("telescope").load_extension("media_files")
				end,
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
				config = function()
					---@diagnostic disable-next-line: different-requires
					require("telescope").load_extension("ui-select")
				end,
			},
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
	---- Comments
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("plugins.comment")
		end,
	},

	---- Delimiters
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

	---- File Browser
	{
		"echasnovski/mini.files",
		lazy = false,
		config = function()
			require("plugins.files")
		end,
	},

	---- Git
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.gitsigns")
		end,
	},

	-- Highlighting
	{
		"tzachar/highlight-undo.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.highlight-undo")
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		config = function()
			require("plugins.hipatterns")
		end,
	},

	---- Icons
	{ "kyazdani42/nvim-web-devicons", lazy = true },

	---- Indentation Guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugins.indentline")
		end,
	},

	---- Keymaps
	{ "anuvyklack/hydra.nvim", lazy = true },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.which-key")
		end,
	},

	---- Macros
	{
		"ecthelionvi/NeoComposer.nvim",
		enabled = false,
		dependencies = { "kkharji/sqlite.lua" },
		config = function()
			require("NeoComposer").setup()
		end,
	},

	---- Navigation
	{
		"folke/flash.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugins.flash")
		end,
	},

	---- Notifications
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("plugins.notify")
		end,
	},

	---- Startscreen
	{
		"echasnovski/mini.starter",
		event = "VimEnter",
		config = function()
			require("plugins.starter")
		end,
	},

	---- Statuscolumn
	{
		"luukvbaal/statuscol.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.statuscol")
		end,
	},

	---- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.lualine")
		end,
	},

	---- Terminal
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.toggleterm")
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

	-- UI Overhaul
	require("plugins.noice"),
	{ "folke/twilight.nvim", event = "VeryLazy" },
	require("plugins.zen-mode"),
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
