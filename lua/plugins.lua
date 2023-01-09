return require("lazy").setup({
	-- Dependencies
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",

	-- LSP
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.lsp.nvim-cmp")
		end,
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				config = function()
					require("plugins.lsp.luasnip")
				end,
			},
		},
	},
	{ "hrsh7th/cmp-buffer" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-path" },

	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		config = function()
			require("plugins.lsp.servers")
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function()
			require("plugins.lsp.null-ls")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "CursorHold",
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("telescope").load_extension("fzf")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "CursorHold",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "nvim-treesitter/playground" },
	{ "nvim-treesitter/nvim-treesitter-refactor" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },

	-- UI
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("plugins.catppuccin")
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		event = "CursorHold",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("plugins.gitsigns")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.indentline")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("plugins.lualine")
		end,
	},

	{
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup()
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			require("plugins.notify")
		end,
	},

	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{
		"echasnovski/mini.starter",
		config = function()
			require("plugins.starter")
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("todo-comments").setup()
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	},

	{
		"kyazdani42/nvim-tree.lua",
		event = "CursorHold",
		config = function()
			require("plugins.nvim-tree")
		end,
	},

	{ "kyazdani42/nvim-web-devicons" },
})
