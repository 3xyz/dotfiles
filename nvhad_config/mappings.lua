---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<S-H>"] = {"gt", "go to prev tab"},
    ["<S-L>"] = {"gT", "go to next tab"},
    ["]p"] = {"o<Esc>pk0", "paste to line below"},
    ["[p"] = {"O<Esc>pj0", "paste to line below"},
    ["f"] = {"<Plug>(leap-forward-to)", "leap search forward"},
    ["F"] = {"<Plug>(leap-backward-to)", "leap search forward"},
  },
  x = {
    ["f"] = {"<Plug>(leap-forward-to)", "leap search forward"},
    ["F"] = {"<Plug>(leap-backward-to)", "leap search forward"},
  },
  o = {
    ["f"] = {"<Plug>(leap-forward-to)", "leap search forward"},
    ["F"] = {"<Plug>(leap-backward-to)", "leap search forward"},
  },
  v = {
    ["f"] = {"<Plug>(leap-forward-to)", "leap search forward"},
    ["F"] = {"<Plug>(leap-backward-to)", "leap search forward"},
  }
}

-- more keybinds!

return M
