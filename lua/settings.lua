local g = vim.g
local o = vim.o

o.termguicolors = true

-- Disable neovim plugins
local default_plugins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Keep cursor off edge
o.scrolloff = 8

-- Line numbers / markings
o.number = true
o.relativenumber = true
o.signcolumn = "yes:2"
o.cursorline = true

-- Tabs and indents
o.expandtab = true
o.cindent = true
o.wrap = true
o.tabstop = 4
o.softtabstop = -1
o.shiftwidth = 0

-- Clipboard
o.clipboard = "unnamedplus"

-- Search case
o.ignorecase = true
o.smartcase = true

-- Undo / backup
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- History length
o.history = 50

-- Buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = "view"

-- Spelling language
o.spelllang = "en_au"

-- Conceal level
o.conceallevel = 2

-- Whole line find and replace by default
o.gdefault = true

-- Use bash to execute commands
o.shell = "/run/current-system/sw/bin/bash"
