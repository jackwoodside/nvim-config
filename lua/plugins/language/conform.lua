local va = vim.api

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		python = { "black" },
		sh = { "shfmt" },
		tex = { "latexindent" },
	},
})

-- Format on save
va.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	callback = function(args)
		va.nvim_buf_set_var(args.buf, "format?", true)
	end,
})
va.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		if va.nvim_buf_get_var(args.buf, "format?") then
			require("conform").format({ bufnr = args.buf })
		end
	end,
})

-- Toggle formatting
vim.keymap.set("n", "<leader>lf", function()
	local status = va.nvim_buf_get_var(0, "format?")
	va.nvim_buf_set_var(0, "format?", not status)
end, { desc = "Toggle formatting", silent = true })
