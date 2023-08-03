local function map(m, k, v, d)
	vim.keymap.set(m, k, v, { desc = d, silent = true })
end

-- Settings
require("dapui").setup({
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "right",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25,
			position = "bottom",
		},
	},
})

-- Mappings
