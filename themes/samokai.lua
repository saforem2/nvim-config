-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
-- @type Base46Tablelocal
M = {}

-- local string_green = "#a9ff68"
-- red = "#ff7f8d", -- StatusBar (username)
-- baby_pink = "#ffa198",
-- pink = "#ec6cb9",
-- line = "#33383d", -- for lines like vertsplit

M.base_30 = {
  white = "#d3dbe3",
  darker_black = "#161616",
  black = "#1c1c1c", --  nvim bg
  black2 = "#222222",
  one_bg = "#33383d",
  one_bg2 = "#383d42", -- StatusBar (filename)
  one_bg3 = "#42474c",
  grey = "#4c5156", -- Line numbers (shouldn't be base01?)
  grey_fg = "#565b60", -- Why this affects comments?
  grey_fg2 = "#60656a",
  light_grey = "#6a6f74",

  -- white = "#d3dbe3",
  -- darker_black = "#1F2428",
  -- black = "#24292E", --  nvim bg
  -- black2 = "#2e3338",
  -- one_bg = "#33383d",
  -- one_bg2 = "#383d42", -- StatusBar (filename)
  -- one_bg3 = "#42474c",
  -- grey = "#4c5156", -- Line numbers (shouldn't be base01?)
  -- grey_fg = "#565b60", -- Why this affects comments?
  -- grey_fg2 = "#60656a",
  -- light_grey = "#6a6f74",
  -- red = "#ff7f8d", -- StatusBar (username)
  -- baby_pink = "#ffa198",
  -- pink = "#ec6cb9",
  -- line = "#33383d", -- for lines like vertsplit
  -- green = "#56d364", -- StatusBar (file percentage)
  -- vibrant_green = "#85e89d",
  -- nord_blue = "#58a6ff", -- Mode indicator
  -- blue = "#79c0ff",
  -- yellow = "#ffdf5d",
  -- sun = "#ffea7f",
  -- purple = "#d2a8ff",
  -- dark_purple = "#bc8cff",
  -- teal = "#39c5cf",
  -- orange = "#ffab70",
  -- cyan = "#56d4dd",
  -- statusline_bg = "#2b3035",
  -- lightbg = "#383d42",
  -- pmenu_bg = "#58a6ff", -- Command bar suggestions
  -- folder_bg = "#58a6ff",


  red = "#ff7f8d", -- StatusBar (username)
  baby_pink = "#FF7eb6",
  pink = "#Ec6cb9",
  line = "#444444", -- for lines like vertsplit
  green = "#56d364", -- StatusBar (file percentage)
  vibrant_green = "#85e89d",
  nord_blue = "#58a6ff", -- Mode indicator
  blue = "#33b1ff",
  yellow = "#FFdf5D",
  sun = "#ffea7f",
  purple = "#d2a8ff",
  dark_purple = "#AE81FF", -- #bc8cff",
  teal = "#39c5cf",
  orange = "#ffab70",
  cyan = "#56d4dd",
  statusline_bg = "#222222",
  lightbg = "#383d42",
  pmenu_bg = "#58a6ff", -- Command bar suggestions
  folder_bg = "#58a6ff",
  lavender = "#C7D1FF",
  vibrant_blue = "#00CCFF",
  neon_green = "#a9ff68",
}

M.base_16 = {
  base00 = "#1c1c1c", -- Default bg
  base01 = "#222222", -- Lighter bg (status bar, line number, folding mks)
  base02 = "#282828", -- Selection bg
  base03 = "#333333", -- Comments, invisibles, line hl
  base04 = "#4c5156", -- Dark fg (status bars)
  base05 = "#c9d1d9", -- Default fg (caret, delimiters, Operators)
  base06 = "#d3dbe3", -- Light fg (not often used)
  base07 = "#dde5ed", -- Light bg (not often used)
  base08 = "#B392E9", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = "#ffab70", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = "#ffdf5d", -- Classes, Markup Bold, Search Text Background
  base0B = "#a5d6ff", -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = "#83caff", -- Support, regex, escape chars
  base0D = "#6AB1F0", -- Function, methods, headings
  base0E = "#ff7f8d", -- Keywords
  base0F = "#85e89d", -- Deprecated, open/close embedded tags
}
--   base09 = "#ffab70", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
--   base0A = "#F8BD96", -- Classes, Markup Bold, Search Text Background
--   base0B = "#a5d6ff", -- Strings, Inherited Class, Markup Code, Diff Inserted
--   base0C = "#83caff", -- Support, regex, escape chars
--   base0D = "#6AB1F0", -- Function, methods, headings
--   base0E = "#ff7f8d", -- Keywords
--   base0F = "#85e89d", -- Deprecated, open/close embedded tags
-- }

M.type = "dark"

M.polish_hl = {
  [ '@constant'] = {
    fg = M.base_30.pink,
    bold=true,
  },

  -- ['@string'] = {
  --   fg=M.base_30.neon_green,
  --   italic=true,
  -- },
  --
  Headline1 = {
    bg="#FB6896"
  },
  Headline2 = {
    bg="#002933"
  },
  Comment = {
    italic = false,
  },

  ["@string"] = {
    fg = M.base_30.lavender,
  },
  --
  ["@field.key"] = {
    fg = M.base_30.white,
  },

  -- ["@constructor"] = {
  --   -- fg = M.base_30.neon_green,
  --   bold = true,
  -- },

  -- ["@tag.attribute"] = {
  --   link = "@method",
  -- },
  ["@punctuation.bracket"] = {
    fg = M.base_30.orange,
  },

  -- ["@string"] = {
  --   fg = M.base_30.white,
  -- },

  -- ["@field.key"] = {
  --   fg = M.base_30.white,
  -- },

  ["@constructor"] = {
    fg = M.base_30.vibrant_green,
    bold = true,
  },

  ["@tag.attribute"] = {
    link = "@method",
  },

}

M.type = "dark"

M = require("base46").override_theme(M, "samokai")

return M
