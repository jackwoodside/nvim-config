local cmp = require("cmp")
local luasnip = require("luasnip")

local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local aliases = {
	buffer = "Buffer",
	nvim_lsp = "LSP",
	path = "Path",
	luasnip = "Snippet",
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
		format = function(entry, item)
			item.kind = string.format("%s %s", icons[item.kind], item.kind)
			item.menu = string.format("[%s]", aliases[entry.source.name] or entry.source.name)
			return item
		end,
	},
})
