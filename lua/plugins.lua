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

	{ "mfussenegger/nvim-dap", event = { "BufReadPre", "BufNewFile" } },
	{
		"rcarriga/nvim-dap-ui",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.language.dap-ui")
		end,
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.language.cmp")
		end,
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("plugins.language.snippets")
				end,
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-path" },
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.telescope")
		end,
		dependencies = {
			{ "aznhe21/actions-preview.nvim" },
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
	{
		"echasnovski/mini.align",
		event = "VeryLazy",
		config = function()
			require("mini.align").setup()
		end,
	},

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

	---- Folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("plugins.ufo")
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
		main = "ibl",
		config = function()
			require("plugins.indentline")
		end,
	},

	---- Keymaps
	{
		"echasnovski/mini.clue",
		event = "VeryLazy",
		config = function()
			require("plugins.clue")
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
		enabled = false,
		commit = "51428469218c3b382cab793a2d53c72014627fbe",
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
