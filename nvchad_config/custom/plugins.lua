local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "tpope/vim-unimpaired",
    -- "tummetott/unimpaired.nvim",
    lazy=false,
    enabled = true,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    ft = "markdown",
    config = function()
      require("pretty-fold").setup {
        keep_indentation = false,
        fill_char = "━",
        sections = {
          left = {
            "━━┫",
            "content",
            "┣━━",
          },
          right = {
            "┫ ",
            "number_of_folded_lines",
            ": ",
            "percentage",
            " ┣━━",
          },
        },
      }
    end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    -- rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    dependencies = { "starwing/luautf8" },
    ft = "markdown",
    config = function()
      require("mkdnflow").setup {
        mappings = {
          MkdnEnter = { { "n", "v" }, "<CR>" },
          MkdnTab = false,
          MkdnSTab = false,
          MkdnNextLink = { "n", "<leader>m<Tab>" },
          MkdnPrevLink = { "n", "<leader>m<S-Tab>" },
          MkdnNextHeading = { "n", "]]" },
          MkdnPrevHeading = { "n", "[[" },
          MkdnGoBack = { "n", "<leader>m<BS>" },
          MkdnGoForward = { "n", "<leader>m<Del>" },
          MkdnCreateLink = false, -- see MkdnEnter
          MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>mp" }, -- see MkdnEnter
          MkdnFollowLink = false, -- see MkdnEnter
          MkdnDestroyLink = { "n", "<M-CR>" },
          MkdnTagSpan = { "v", "<M-CR>" },
          MkdnMoveSource = { "n", "<leader>mm" },
          MkdnYankAnchorLink = { "n", "yaa" },
          MkdnYankFileAnchorLink = { "n", "yfa" },
          MkdnIncreaseHeading = { "n", "+" },
          MkdnDecreaseHeading = { "n", "-" },
          MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
          MkdnNewListItem = false,
          MkdnNewListItemBelowInsert = { "n", "o" },
          MkdnNewListItemAboveInsert = { "n", "O" },
          MkdnExtendList = false,
          MkdnUpdateNumbering = { "n", "<leader>mn" },
          MkdnTableNextCell = { "i", "<Tab>" },
          MkdnTablePrevCell = { "i", "<S-Tab>" },
          MkdnTableNextRow = false,
          MkdnTablePrevRow = { "i", "<M-CR>" },
          MkdnTableNewRowBelow = { "n", "<leader>mr" },
          MkdnTableNewRowAbove = { "n", "<leader>mR" },
          MkdnTableNewColAfter = { "n", "<leader>mc" },
          MkdnTableNewColBefore = { "n", "<leader>mC" },
          MkdnFoldSection = { "n", "<leader>mf" },
          MkdnUnfoldSection = { "n", "<leader>mF" },
        },
      }
    end,
  },
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    enabled = true,
  },
  -- dap and dap-ui
  {
    "mfussenegger/nvim-dap",
    -- enabled = false,
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- "theHamsta/nvim-dap-virtual-text",
      "nvim-dap-virtual-text",
    },
    config = function()
      require("custom.configs.dap").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    -- enabled = false,
    -- config = function()
    --   require("custom.configs.dapui")
    -- end,
    lazy = true,
  },
  -- dap python
  {
    "mfussenegger/nvim-dap-python",
    -- enabled = false,
    ft = "python",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("dap-python").setup "~/Desktop/usefull_things/venv/bin/python3"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    enabled = true,
    lazy = false,
    -- lazy = true,
  },
  {
    "lunarvim/bigfile.nvim",
    lazy = false,
    enabled = false,
  },
  {
    "powerman/vim-plugin-ruscmd",
    lazy = false,
    enabled = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    enabled = true,
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- {
  --   ""
  -- },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
