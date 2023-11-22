vim.g.ui_notifications_enabled = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.list = true
local enable_providers = {
  "python3_provider",
  "node_provider",
  -- and so on
}
for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
-- vim.g.python3_host_prog = '/Users/samforeman/venvs/py3nvim/bin/python3'
-- vim.g.python_highlight_all = 1
-- vim#g[#python3_host_prog] = '/Users/samforeman/venvs/py3nvim/bin/python3'
-- vim.g#loaded_python3_provider = 0
-- local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
-- vim.cmd.source(vimrc)
-- vim.notify = require('notify')

-- vim.g.python3_host_prog = '/usr/bin/python3'

-- colorscheme = "sam"
vim.opt.listchars = {
  tab = "│→",
  extends = "⟩",
  precedes = "⟨",
  trail = "·",
  nbsp = "␣",
}
vim.opt.signcolumn = "auto"
-- vim.opt.python3_host_prog = '/Users/samforeman/venvs/py3nvim/bin/python3' 
--
-- local highlight = {
--     "RainbowRed",
--     "RainbowYellow",
--     "RainbowBlue",
--     "RainbowOrange",
--     "RainbowGreen",
--     "RainbowViolet",
--     "RainbowCyan",
-- }
--
-- local ibl = require('indent-blankline.nvim')
-- local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)

-- vim.g.rainbow_delimiters = { highlight = highlight }
-- require("ibl").setup { scope = { highlight = highlight } }k

-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- -- vscode format i.e json files
-- vim.g.vscode_snippets_path = "your snippets path"
--
-- -- snipmate format 
-- vim.g.snipmate_snippets_path = "your snippets path"
--
-- -- lua format 
-- vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"
--
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
--
-- #E0E4EB #C2C8D6 #A3ADC2
-- #8592AD #52607A #3D475C
-- #2F3541 #232730 #1C2027
-- #16191F #13161B #101216
-- #D65C66 #8F3D44 #422426
-- #D65C85 #8F3D58 #42242E
-- #D6995C #8F663D #423324
-- #D6C25C #8F813D #423D24
-- #9470DB #6345A1 #2D2145
-- #C25CD6 #813D8F #3D2442
-- #5CD6C2 #3D8F81 #24423D
-- #C2D65C #818F3D #3D4224
-- #5CADD6 #337799 #243842
-- #7082DB #4554A1 #242942
-- #85D65C #588F3D #2E4224
