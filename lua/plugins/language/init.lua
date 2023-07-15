return {
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({ PATH = "append" })
		end,
	},

	{ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.language.lsp")
		end,
	},

	{ "jose-elias-alvarez/null-ls.nvim", event = { "BufReadPre", "BufNewFile" } },
	{
		"jayp0521/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.language.null-ls")
		end,
	},

	{ "mfussenegger/nvim-dap", event = { "BufReadPre", "BufNewFile" } },
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.language.dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.language.dap-ui")
		end,
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
}
