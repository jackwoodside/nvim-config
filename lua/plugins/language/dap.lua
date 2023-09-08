-- Debuggers
require("mason-nvim-dap").setup({
	ensure_installed = {
		"bash", -- bash-debug-adapter
		"cppdbg", -- cpptools
	},
	handlers = {},
})

-- Settings
require("dap")
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

require("dap").configurations.cpp = {
	{
		name = "Launch executable",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Launch executable with arguments",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/", "file")
		end,
		args = function()
			return vim.split(vim.fn.input("Arguments: "), " ")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
}
