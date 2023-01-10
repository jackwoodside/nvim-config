local types = require("luasnip.util.types")
local function map(m, k, v, opts)
    vim.keymap.set(m, k, v, opts)
end

require("luasnip").setup({
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "DiffAdd" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "DiffDelete" } },
			},
		},
	},
})

require("luasnip/loaders/from_vscode").load({ include = {
    "cpp",
    "latex",
}})

map({ "i", "s" }, "<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
map({ "i", "s" }, "<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')
