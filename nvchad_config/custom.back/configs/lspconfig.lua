local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a tab::le
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "cssls", "tsserver", "clangd", "pylsp", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "cssls", "tsserver", "clangd", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "ash-language-server", "cssls", "tsserver", "clangd", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.pylsp.setup {
--   on_attach = on_attach,
--   settings = {
--     pylsp = {
--       plugins = {
--         -- formatter options
--         black = { enabled = false },
--         autopep8 = { enabled = false },
--         yapf = { enabled = true },
--         -- linter options
--         pylint = {
--           enabled = true,
--           executable = "pylint",
--         },
--         pyflakes = { enabled = false },
--         pycodestyle = { enabled = false },
--         -- type checker
--         pylsp_mypy = { enabled = true },
--         -- auto-completion options
--         jedi_completion = { fuzzy = true },
--         -- import sorting
--         pyls_isort = { enabled = true },
--       },
--     },
--   },
--   flags = {
--     debounce_text_changes = 200,
--   },
--   capabilities = capabilities,
-- }

-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   init_options = { documentFormatting = true },
--   settings = {
--     languages = {
--       python = {
--         pyright = {
--           indent = 2,
--         },
--       },
--     },
--   },
-- }
