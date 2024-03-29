local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a tab::le
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "cssls", "tsserver", "clangd", "pylsp", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "cssls", "tsserver", "clangd", "ruff_lsp", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "cssls", "tsserver", "clangd", "pylyzer", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "cssls", "tsserver", "clangd", "jedi_language_server", "bashls", "jsonls", "spectral", "sqlls" }
-- local servers = { "html", "cssls", "tsserver", "clangd", "bashls", "jsonls", "spectral", "sqlls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.ruff_lsp.setup {
--   on_attach = on_attach,
--   init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {},
--     }
--   }
-- }

-- extra_args = { "--indent-after-paren", "2" }

-- lspconfig.pylsp.setup {
--   on_attach = on_attach,
--   settings = {
--     pylsp = {
--       plugins = {
--         -- formatter options
--         black = { enabled = false },
--         autopep8 = { enabled = false },
--         yapf = { enabled = false },
--         -- linter options
--         pylint = {
--           enabled = false,
--           executable = "pylint",
--           args = {
--             "--indent-string", "  "
--           },
--         },
--         pyflakes = { enabled = false },
--         pycodestyle = {
--           enabled = false,
--         },
--         -- type checker
--         pylsp_mypy = { enabled = false },
--         -- auto-completion options
--         jedi_completion = { fuzzy = false },
--         -- import sorting
--         pyls_isort = { enabled = false },
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
