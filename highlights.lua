-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  -- ['@string'] = {
  --   fg="#a9ff68",
  --   italic=true,
  -- },
  Headline1 = {
    bg="#FB6896"
  },
  Headline2 = {
    bg="#002933"
  },
  Comment = {
    italic = false,
  },
  -- Normal = {
  --   bg = "#1c1c1c",
  -- },
  CodeiumSuggestion = { fg = "#444444", bg = "#222222" },
  -- RainbowDelimiterYellow = { fg="#FFFF00", bold=true },
  -- RainbowDelimiter00     = { fg="#f8f8f8" },
  RainbowDelimiterRed = { fg="#ee5396", bold=true },
  RainbowDelimiterOrange     = { fg="#FD971F" },
  RainbowDelimiterYellow     = { fg="#FFFF00", bold=true },
  RainbowDelimiterGreen     = { fg="#36CE5E"},
  RainbowDelimiterBlue     = { fg="#1A8FFF", bold=true},
  RainbowDelimiterPurple     = { fg="#AE81FF" },
  RainbowDelimiterCyan     = { fg="#00CCFF", bold=true },
  -- NormalFloat = { bg="#222222" },
  -- WhichKeyDesc = { fg="#d0d0d0" },
  -- WhichKeyGroup = { fg="#ee5396" },
  -- WhichKeyBorder = { fg="#00CCFF" },
  -- WhichKeyFloat = { bg="#222222" },
  -- IlluminatedWordText = { bg="#282828", fg="#ff5252" },
  -- IlluminatedWordRead = { bg="#282828", fg="#ffffff" },
  -- IlluminatedWordWrite = { bg="#252525", fg="#bdbdbd" },
  -- CursorLineNr = {
  --   fg="#d0d0d0",
  -- },
  -- CursorLine = {
  --   bg="#282828",
  -- },
  -- BufferLineTabClose = {
  --   bg="black2",
  -- }
  -- BufferLineTabSelected xxx guifg=#2e3338 guibg=#58a6ff
  -- BufferLineTabClose xxx guifg=#ff7f8d guibg=#24292e
  -- BufferLineTab  xxx guifg=#6a6f74 guibg=#42474c
  -- BufferLineSeparatorSelected xxx guifg=#2e3338 guibg=#2e3338
  -- BufferLineSeparatorVisible xxx guifg=#2e3338 guibg=#2e3338
  -- BufferLineSeparator xxx guifg=#2e3338 guibg=#2e3338
  -- BufferLineModifiedSelected xxx guifg=#56d364 guibg=#24292e
  -- BufferLineModifiedVisible xxx guifg=#ff7f8d guibg=#2e3338
  -- BufferLineModified xxx guifg=#ff7f8d guibg=#2e3338
  -- BufferlineIndicatorSelected xxx guifg=#24292e guibg=#24292e
  -- BufferLineFill xxx guifg=#565b60 guibg=#2e3338
  -- BufferLineCloseButtonSelected xxx guifg=#ff7f8d guibg=#24292e
  -- BufferLineCloseButtonVisible xxx guifg=#6a6f74 guibg=#2e3338
  -- BufferLineCloseButton xxx guifg=#6a6f74 guibg=#2e3338
  -- BufferLineErrorDiagnostic xxx guifg=#6a6f74 guibg=#2e3338
  -- BufferLineError xxx guifg=#6a6f74 guibg=#2e3338
  -- BufferLineBufferVisible xxx guifg=#6a6f74 guibg=#2e3338
  -- BufferLineBufferSelected xxx guifg=#d3dbe3 guibg=#24292e
  -- BufferlineIndicatorVisible xxx guifg=#2e3338 guibg=#2e3338
  -- BufferLineBackground xxx guifg=#6a6f74 guibg=#2e3338
  -- BufferLineRightCustomAreaText2 xxx guifg=#ff7f8d
  -- BufferLineRightCustomAreaText1 xxx guifg=#d3dbe3
  -- BufferLineDuplicateVisible xxx guifg=#79c0ff guibg=#2e3338
  -- BufferLineDuplicateSelected xxx guifg=#ff7f8d guibg=#24292e
  -- BufferLineDuplicate xxx guibg=#2e3338
  -- BufferLineDevIconDefaultInactive xxx cleared
  -- BufferLineDevIconDefaultSelected xxx cleared
}

---@type HLTable
M.add = {
  -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
  -- RainbowDelimiter00 = { fg = "red" },
  -- RainbowDelimiter01 = { fg = "orange" },
  -- RainbowDelimiter02 = { fg = "yellow" },
  -- RainbowDelimiter03 = { fg = "green" },
  -- RainbowDelimiter04 = { fg = "blue" },
  -- RainbowDelimiter05 = { fg = "purple" },
  -- RainbowDelimiter06 = { fg = "pink" },
}


return M
