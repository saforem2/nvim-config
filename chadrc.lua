---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
local extras = require("custom.extras")
-- local base16 = require "molokai.github-dark".base_16
-- local base30 = require "molokai.github-dark".base_30
-- local themes = require("custom.themes")

M.ui = {
  theme = "molokai",
  theme_toggle = { "molokai", "one_light" },
  -- hl_override = highlights.override,
  hl_override = highlights.override,
  hl_add = highlights.add,
  -- hl_override = highlights.hl_override,
  -- hl_add = highlights.add,
  -- hl_override = require("lua.molokai.highlights")
  -- hl_override = require('molokai.highlights'),
  statusline = {
    theme = "minimal",
    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "block",
    overriden_modules = nil,
  },
  extended_integrations = {
    "rainbowdelimiters",
    "trouble",
    "dap",
    "alpha",
    "todo",
    "notify",
    "codeactionmenu",
    "hop",
    "bufferline",
    "codeactionmenu"
  },
}
  -- tabufline = {
  --   lazyload = true,
  --   overriden_modules = nil,
  -- },

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
