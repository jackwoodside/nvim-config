local luasnip = require("luasnip")
local types = require("luasnip.util.types")
local function map(m, k, v)
	vim.keymap.set(m, k, v)
end

luasnip.setup({
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

-- require("luasnip/loaders/from_vscode").lazy_load()

map({ "i", "s" }, "<C-j>", function()
	luasnip.jump(1)
end)
map({ "i", "s" }, "<C-k>", function()
	luasnip.jump(-1)
end)
