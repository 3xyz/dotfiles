local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

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
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end, -- Override to setup mason-lspconfig
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
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
      "nvim-dap-virtual-text"
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
      require("dap-python").setup("~/Desktop/usefull_things/venv/bin/python3")
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
    enabled = false
  },
  {
    "powerman/vim-plugin-ruscmd",
    lazy = false,
    enabled = true,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
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
