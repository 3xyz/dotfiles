---@type MappingsTable
local M = {}

M.general = {
   n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<S-H>"] = {"gt", "go to prev tab"},
    ["<S-L>"] = {"gT", "go to next tab"},
    -- ["<leader>fk"] = {"<cmd>Telescope keymaps<cr>", "find keymaps"},
    ["x"] = {'"_x', "cut without copy"},
    ["f"] = {"<Plug>(leap-forward-to)", "leap search forward"},
    ["F"] = {"<Plug>(leap-backward-to)", "leap search forward"},
    ["<leader>X"] = {"<cmd>lua require('spectre').open()<CR>", "run Spectre plugin"},
    ["<leader>ft"] = {"<cmd>TroubleToggle<CR>", "Find troubles"},
    ["<leader>fn"] = { "<cmd>TodoTelescope<CR>", "Find TODO" },
    ["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", "Find keymaps" },
    -- ["]<space>"] = { "o<ESC>k", "Add line below" },
    -- ["[<space>"] = { "O<ESC>j", "Add line above" },
  },
  x = {
  },
  o = {
  },
  v = {
    ["f"] = {"<Plug>(leap-forward-till)", "leap search forward"},
    ["F"] = {"<Plug>(leap-backward-till)", "leap search forward"},
  },
  -- i = {
  --   ["оо"] = {"<ESC>", ""},
  -- },
}

-- more keybinds!

M.dap = {
  n = {
    ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    ["<leader>de"] = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    ["<leader>dE"] = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    ["<leader>dt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    ["<leader>dR"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    ["<leader>dC"] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>dh"] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    ["<leader>dS"] = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    -- ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<Down>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    -- ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<Right>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    -- ["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    ["<Left>"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    -- ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    ["<Up>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>dx"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
  }
}

return M
