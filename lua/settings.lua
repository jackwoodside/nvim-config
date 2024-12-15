local o = vim.o
local opt = vim.opt

o.termguicolors = true

-- Decrease update time
o.timeout = true
o.timeoutlen = 500
o.updatetime = 200

-- Keep cursor off edge
o.scrolloff = 8

-- Line numbers / markings
o.number = true
o.relativenumber = true
o.signcolumn = "yes:2"
o.cursorline = true

-- Folding
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
opt.fillchars = { foldclose = "󰅂", foldopen = "󰅀", foldsep = " " }

-- Tabs and indents
o.expandtab = true
o.cindent = true
o.wrap = true
o.tabstop = 4
o.softtabstop = -1
o.shiftwidth = 0
opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "󱁐" }

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

-- Whole line find and replace by default
o.gdefault = true
