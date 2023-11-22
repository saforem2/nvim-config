---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- ['p'] = {
    --   {
    --     ['u'] = { ":Lazy update<CR>", "Update Plugins"},
    --   },
    --   "Plugins"
    --
    -- },
    ["]]"] = {
      "<cmd>tabnext<cr>",
      "Next Tab"
    },
    ["[["] = {
      "<cmd>tabprevious<cr>",
      "Next Tab"
    },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["\\"] = {
      "<cmd>lua require('notify').dismiss()<CR>",
      "Dismiss Notification"
    },
    ["<leader>\\"] = {"<cmd>QuartoPreview<cr>", "Quarto Preview"},
    ["<leader>d"] = {[["_d]], "Beginning of line"},
    ["0"] = {"^", "Beginning of line"},
    ["<C-J>"] = {"J", "Join line"},
    ["X"] = {
        [[:keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>]],
        "Split line"
    },
    -- ["<leader>b"] = {name = "Buffers"},
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
