local settings = require("plugins.lsp.settings")

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


-- Flags
local lsp_flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 200,
}

-- Configure servers
local lspconfig = require("lspconfig")
local get_servers = require("mason-lspconfig").get_installed_servers
local function lsp_attach(client, buf)
    settings.disable_formatting(client)
    settings.mappings(buf)
end
local lsp_capabilities = settings.capabilities()

-- Loop over all servers
for _, server_name in ipairs(get_servers()) do
    lspconfig[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        flags = lsp_flags,
    })
end

-- Server-specific settings (after the loop to avoid being overwritten)
local words = {}
local path = "/home/jack/.config/nvim/lua/plugins/lsp/words.txt"
for word in io.open(path, "r"):lines() do
    table.insert(words, word)
end

lspconfig["ltex"].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    flags = lsp_flags,
    settings = {
        ltex = {
            language = "en-AU",
            dictionary = {
                ["en-AU"] = words,
            },
            checkFrequency = "save",
        },
    },
})

lspconfig["texlab"].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    flags = lsp_flags,
    settings = {
        texlab = {
            build = {
                onSave = true,
                forwardSearchAfter = true,
            },
            chktex = { onOpenAndSave = true },
            forwardSearch = {
                executable = "sioyek",
                args = {
                    "--forward-search-file",
                    "%f",
                    "--forward-search-line",
                    "%l",
                    "%p",
                },
            },
            diagnostics = {
                ignoredPatterns = {
                    "Underfull",
                    "Overfull",
                    "Wrong length of dash",
                    "terminated with space",
                    "Fira fonts",
                },
            },
        },
    },
})

lspconfig["sumneko_lua"].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    flags = lsp_flags,
    settings = {
        Lua = {
            completion = {
                enable = true,
                showWord = "Disable",
            },
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = { os.getenv("VIMRUNTIME") },
            },
            telemetry = {
                enable = false,
            },
        }
    }
})
