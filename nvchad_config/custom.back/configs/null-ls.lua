local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- *sh
  b.formatting.beautysh,

  -- C lang
  b.formatting.clang_format,

  -- json
  b.formatting.fixjson.with { filetypes = { "json" } },
  b.formatting.jq.with { filetypes = { "json" } },

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  b.formatting.prettier.with { filetypes = { "markdown", "css" } },

  b.formatting.htmlbeautifier.with { filetypes = { "html" } },

  -- SQL
  b.formatting.sqlfluff.with { filetypes = { "sql" } },

  -- Python
  -- b.formatting.black.with { filetypes = { "python" } },
  -- b.formatting.yapf.with { extra_args = { "--style", "google" }, filetypes = { "python" } },
  b.formatting.yapf.with {
    extra_args = { 
      "--style", "{based_on_style: pep8, indent_width: 2, column_limit: 140, DEDENT_CLOSING_BRACKETS: 1}"
    },
    filetypes = { "python" },
  },
  b.formatting.reorder_python_imports.with { filetypes = { "python" } },
  b.diagnostics.ruff,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- yml, yaml
  b.formatting.yamlfix.with { filetypes = { "yaml", "yml" } },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
