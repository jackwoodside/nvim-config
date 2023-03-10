local cmp = require("cmp")
local luasnip = require("luasnip")

local icons = {
	Class = "ﴯ",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "ﰠ",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "ﰠ",
	Reference = "",
	Snippet = "",
	Struct = "פּ",
	Text = "",
	TypeParameter = "",
	Unit = "塞",
	Value = "",
	Variable = "",
}

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-PageUp>"] = cmp.mapping.scroll_docs(-4),
		["<C-PageDown>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),

	sources = cmp.config.sources({
		{ name = "luasnip", max_item_count = 10 },
		{ name = "nvim_lsp", max_item_count = 10 },
	}, {
		{ name = "buffer", max_item_count = 10 },
		{ name = "path", max_item_count = 10 },
	}),

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	formatting = {
		format = function(_, item)
			item.kind = string.format("%s %s", icons[item.kind], item.kind)
			return item
		end,
	},
})
