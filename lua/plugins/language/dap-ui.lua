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
local hydra = require("hydra")
local hint = [[
_b_: Toggle breakpoint _c_: Continue _s_: Step forward
_d_: Toggle interface  _r_: Restart  _S_: Step backward
                     _q_: Quit
]]

hydra({
	name = "DAP",
	hint = hint,
	config = {
		color = "pink",
		invoke_on_body = true,
	},

	body = "<leader>d",
	heads = {
		{ "b", "<CMD>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint", nowait = true } },
		{ "c", "<CMD>lua require('dap').continue()<CR>", { desc = "Continue", nowait = true } },
		{ "d", "<CMD>lua require('dapui').toggle()<CR>", { desc = "Toggle UI", nowait = true } },
		{ "r", "<CMD>lua require('dap').restart()<CR>", { desc = "Restart", nowait = true } },
		{ "s", "<CMD>lua require('dap').step_over()<CR>", { desc = "Step forward", nowait = true } },
		{ "S", "<CMD>lua require('dap').step_back()<CR>", { desc = "Step backward", nowait = true } },
		{ "q", nil, { desc = "Exit", exit = true, nowait = true } },
	},
})
