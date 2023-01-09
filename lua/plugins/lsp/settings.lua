-- Servers
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "fortls",
        "ltex",
        "texlab",
        "sumneko_lua",
        "nil_ls",
        "jedi_language_server",
    }
})

-- Keybinds
local function map(m, k, v, opts)
    vim.keymap.set(m, k, v, opts)
end

local lsp_attach = function(client, buf)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = true
    local opts = { buffer = buf }
    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gh", vim.lsp.buf.hover, opts)
    map("n", "<C-h", vim.lsp.buf.signature_help, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "<leader>c", vim.lsp.buf.code_action, opts)
    map("n", "<leader>r", vim.lsp.buf.rename, opts)
end

-- Flags
local lsp_flags = {
    allow_incremental_sync = true,   
    debounce_text_changes = 200,
}

-- Configure servers
local lspconfig = require("lspconfig")
local get_servers = require("mason-lspconfig").get_installed_servers
--local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Server-specific settings


-- Loop over all servers
for _, server_name in ipairs(get_servers()) do
    lspconfig[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        flags = lsp_flags,
    })
end
