local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.git.diffview" },
    { import = "nvcommunity.completion.codeium" },
    { import = "nvcommunity.diagnostics.trouble" },
    { import = "nvcommunity.editor.hlargs" },
  },

  -- -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- -- would overwrite `ensure_installed` with the new value.
  -- -- If you'd rather extend the default config, use the code below instead:
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- add tsx and treesitter
  --     vim.list_extend(opts.ensure_installed, {
  --       "tsx",
  --       "typescript",
  --     })
  --   end,
  -- },
  --
  -- -- the opts function can also be used to change the default opts:
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, "😄")
  --   end,
  -- },
  --
  -- -- or you can return new options to override all the defaults
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return {
  --       --[[add your custom lualine config here]]
  --     }
  --   end,
  -- },
  --
  -- -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
  --
  -- -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  -- { import = "lazyvim.plugins.extras.lang.json" },
  --
  -- -- add any tools you want to have installed below
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       "shellcheck",
  --       "shfmt",
  --       "flake8",
  --     },
  --   },
  -- },
  --
  -- -- Use <tab> for completion and snippets (supertab)
  -- -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  -- {
  --   "L3MON4D3/LuaSnip",
  --   keys = function()
  --     return {}
  --   end,
  -- },
  -- -- then: setup supertab in cmp
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     local luasnip = require("luasnip")
  --     local cmp = require("cmp")
  --
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_next_item()
  --           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --           -- this way you will only jump inside the snippet region
  --         elseif luasnip.expand_or_jumpable() then
  --           luasnip.expand_or_jump()
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif luasnip.jumpable(-1) then
  --           luasnip.jump(-1)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },

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
  {
    'wakatime/vim-wakatime',
    lazy = false
  },

  -- {
  --   -- "code-stats/code-stats-vim",
  --   'https://gitlab.com/code-stats/code-stats-vim.git',
  --   lazy = false,
  --   config = function()
  --     -- REQUIRED: set your API key
  --     -- TODO: Replace with environment variable ??
  --     vim.g['codestats_api_key'] = {os.getenv('CODESTATS_API_KEY')}
  --     -- vim.g['codestats_api_key'] = {os.getenv('CODESTATS_API_KEY')}
  --   end
  -- },
  -- Initialize via the CODESTATS_API_KEY environment variable
  {
    'YannickFricke/codestats.nvim',
    config = function()
      require('codestats-nvim').setup()
    end,
    dependencies = {
      {'nvim-lua/plenary.nvim'},
    }
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
  -- QUARTO {{{
  -- {
  --   "quarto-dev/quarto-nvim",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "jmbuhr/otter.nvim",
  --   }
  -- },
  -- {
  --   'quarto-dev/quarto-nvim',
  --   dev = false,
  --   lazy = false,
  --   -- ft = {"quarto"},
  --   dependencies = {
  --     { "neovim/nvim-lspconfig" },
  --     { 'hrsh7th/nvim-cmp' },
  --     {
  --       'jmbuhr/otter.nvim',
  --       dev = false,
  --       opts = {
  --           -- lsp = {
  --           --   hover = {
  --           --     -- border = require 'user.style'.border
  --           --   }
  --           -- }
  --         }
  --     },
  --
  --     -- optional
  --     {
  --       'quarto-dev/quarto-vim',
  --       ft = 'quarto',
  --       dependencies = { 'vim-pandoc/vim-pandoc-syntax' },
  --       -- note: needs additional syntax highlighting enabled for markdown
  --       --       in `nvim-treesitter`
  --       config = function()
  --         -- conceal can be tricky because both
  --         -- the treesitter highlighting and the
  --         -- regex vim syntax files can define conceals
  --         --
  --         -- -- see `:h conceallevel`
  --         vim.opt.conceallevel = 1
  --         --
  --         -- -- disable conceal in markdown/quarto
  --         vim.g['pandoc#syntax#conceal#use'] = false
  --         --
  --         -- -- embeds are already handled by treesitter injectons
  --         vim.g['pandoc#syntax#codeblocks#embeds#use'] = false
  --         vim.g['pandoc#syntax#conceal#blacklist'] = { 'codeblock_delim', 'codeblock_start' }
  --         --
  --         -- but allow some types of conceal in math regions:
  --         -- see `:h g:tex_conceal`
  --         vim.g['tex_conceal'] = 'gm'
  --       end,
  --     },
  --   },
  --   opts = {
  --     closePreviewOnExit = true,
  --     lspFeatures = {
  --       enabled = true,
  --       chunks = 'curly',
  --       languages = { 'r', 'python', 'julia', 'bash', 'lua', 'html' },
  --       diagnostics = {
  --         enabled = true,
  --         triggers = { "BufWritePost" }
  --       },
  --       completion = {
  --         enabled = true,
  --       },
  --     },
  --     keymap = {
  --       hover = 'K',
  --       definition = 'gd',
  --       rename = '<leader>lR',
  --       references = 'gr',
  --     },
  --   }
  -- },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    config = function()
      require('dressing').setup({
        input = {
          enabled = true,
        }
      })
    end
  },

  {
    "quarto-dev/quarto-nvim",
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "html", "lua" },
      },
    },
    ft = { "python", "r", "qmd", "quarto", "markdown", "pandoc" },
    keys = {
      { "<leader>qa", ":QuartoActivate<cr>", desc = "quarto activate" },
      { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "quarto preview" },
      { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
      { "<leader>qh", ":QuartoHelp ", desc = "quarto help" },
      { "<leader>qe", ":lua require'otter'.export()<cr>", desc = "quarto export" },
      { "<leader>qE", ":lua require'otter'.export(true)<cr>", desc = "quarto export overwrite" },
      { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "quarto run to cursor" },
      { "<leader>qra", ":QuartoSendAll<cr>", desc = "quarto run all" },
      { "<leader><cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      { "<c-cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      { "<c-cr>", "<esc>:SlimeSend<cr>i", mode = "i", desc = "send code chunk" },
      { "<c-cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
      { "<cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
      { "<leader>ctr", ":split term://R<cr>", desc = "terminal: R" },
      { "<leader>cti", ":split term://ipython<cr>", desc = "terminal: ipython" },
      { "<leader>ctp", ":split term://python<cr>", desc = "terminal: python" },
      { "<leader>ctj", ":split term://julia<cr>", desc = "terminal: julia" },
    },
    dependencies = { 'vim-pandoc/vim-pandoc-syntax' },
    -- note: needs additional syntax highlighting enabled for markdown
    -- in `nvim-treesitter`
    config = function()
      -- conceal can be tricky because both
      -- the treesitter highlighting and the
      -- regex vim syntax files can define conceals
      -- -- see `:h conceallevel`
      -- vim.opt.conceallevel = 1
      -- disable conceal in markdown/quarto
      -- vim.g['pandoc#syntax#conceal#use'] = false
      -- embeds are already handled by treesitter injectons
      -- vim.g['pandoc#syntax#codeblocks#embeds#use'] = false
      -- vim.g['pandoc#syntax#conceal#blacklist'] = { 'codeblock_delim', 'codeblock_start' }
      -- but allow some types of conceal in math regions:
      -- see `:h g:tex_conceal`
      -- vim.g['tex_conceal'] = 'gm'
    end,
  },


  {
    "jmbuhr/otter.nvim",
    opts = {
      buffers = {
        set_filetype = true,
      },
    },
  },


  {
    "hrsh7th/nvim-cmp",
    dependencies = { "jmbuhr/otter.nvim" },
    opts = function(_, opts)
      ---@param opts cmp.ConfigSchema
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "otter" } }))
    end,
  },

  -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  {
    "jpalardy/vim-slime",
    ft = { "python", "r", "qmd", "quarto", "markdown", "pandoc" },
    init = function()
      vim.b["quarto_is_" .. "python" .. "_chunk"] = false
      Quarto_is_in_python_chunk = function()
        require("otter.tools.functions").is_otter_language_context("python")
      end

      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return a:text
      end
      endfunction
      ]])

      local function mark_terminal()
        vim.g.slime_last_channel = vim.b.terminal_job_id
        vim.print(vim.g.slime_last_channel)
      end

      local function set_terminal()
        vim.b.slime_config = { jobid = vim.g.slime_last_channel }
      end

      -- slime, neovvim terminal
      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1

      require("which-key").register({
        ["<leader>cm"] = { mark_terminal, "mark terminal" },
        ["<leader>cs"] = { set_terminal, "set terminal" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        r_language_server = {},
        julials = {},
        marksman = {
          -- also needs:
          -- $home/.config/marksman/config.toml :
          -- [core]
          -- markdown.file_extensions = ["md", "markdown", "qmd"]
          filetypes = { "markdown", "quarto" },
          root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
        },
      },
    },
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "bash",
  --       "c",
  --       "html",
  --       "javascript",
  --       "json",
  --       "lua",
  --       "luadoc",
  --       "luap",
  --       "markdown",
  --       "markdown_inline",
  --       "python",
  --       "query",
  --       "regex",
  --       "tsx",
  --       "typescript",
  --       "vim",
  --       "vimdoc",
  --       "yaml",
  --       "bash",
  --       "html",
  --       "css",
  --       "javascript",
  --       "json",
  --       "lua",
  --       "markdown",
  --       "markdown_inline",
  --       "python",
  --       "vim",
  --       "yaml",
  --       "python",
  --       "julia",
  --       "r",
  --     },
  --   },
  -- },
  --   -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   -- opts will be merged with the parent spec
  --   opts = { use_diagnostic_signs = true },
  -- },
  --
  -- -- disable trouble
  -- { "folke/trouble.nvim", enabled = false },
  --
  -- -- add symbols-outline
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   cmd = "SymbolsOutline",
  --   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  --   config = true,
  -- },
  --
  -- -- override nvim-cmp and add cmp-emoji
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
  --   end,
  -- },
  --
  -- -- change some telescope options and a keymap to browse plugin files
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   keys = {
  --     -- add a keymap to browse plugin files
  --     -- stylua: ignore
  --     {
  --       "<leader>fp",
  --       function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
  --       desc = "Find Plugin File",
  --     },
  --   },
  --   -- change some options
  --   opts = {
  --     defaults = {
  --       layout_strategy = "horizontal",
  --       layout_config = { prompt_position = "top" },
  --       sorting_strategy = "ascending",
  --       winblend = 0,
  --     },
  --   },
  -- },
  --
  -- -- add telescope-fzf-native
  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --     config = function()
  --       require("telescope").load_extension("fzf")
  --     end,
  --   },
  -- },
  --
  -- -- add pyright to lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   ---@class PluginLspOpts
  --   opts = {
  --     ---@type lspconfig.options
  --     servers = {
  --       -- pyright will be automatically installed with mason and loaded with lspconfig
  --       pyright = {},
  --     },
  --   },
  -- },
  --
  -- -- add tsserver and setup with typescript.nvim instead of lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "jose-elias-alvarez/typescript.nvim",
  --     init = function()
  --       require("lazyvim.util").on_attach(function(_, buffer)
  --         -- stylua: ignore
  --         vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
  --         vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
  --       end)
  --     end,
  --   },
  --   ---@class PluginLspOpts
  --   opts = {
  --     ---@type lspconfig.options
  --     servers = {
  --       -- tsserver will be automatically installed with mason and loaded with lspconfig
  --       tsserver = {},
  --     },
  --     -- you can do any additional lsp server setup here
  --     -- return true if you don't want this server to be setup with lspconfig
  --     ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
  --     setup = {
  --       -- example to setup with typescript.nvim
  --       tsserver = function(_, opts)
  --         require("typescript").setup({ server = opts })
  --         return true
  --       end,
  --       -- Specify * to use this function as a fallback for any server
  --       -- ["*"] = function(server, opts) end,
  --     },
  --   },
  -- },
  --
  -- -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  -- { import = "lazyvim.plugins.extras.lang.typescript" },
  --
  -- -- add more treesitter parsers
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "bash",
  --       "html",
  --       "javascript",
  --       "json",
  --       "lua",
  --       "markdown",
  --       "markdown_inline",
  --       "python",
  --       "query",
  --       "regex",
  --       "tsx",
  --       "typescript",
  --       "vim",
  --       "yaml",
  --     },
  --   },
  -- },
  --
  {
    "nvim-treesitter/playground",
    cmd = "TSHighlightCapturesUnderCursor"
  },

  { "lervag/vimtex", ft="tex" },
  { "knubie/vim-kitty-navigator", lazy=false },
  { "fladson/vim-kitty", lazy=false },
  { "jmbuhr/otter.nvim" },
  {
    "Bekaboo/deadcolumn.nvim",
    lazy=false,
  },

  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   lazy = false,
  --   main="ibl",
  --   opts = {},
  --   config = function()
  --   -- opts = function()
  --     -- local highlight = {
  --     --   "CursorColumn",
  --     --   "Whitespace",
  --     -- }
  --     -- local ibl = require("indent-blankline.nvim")
  --     require("indent-blankline.nvim").setup({
  --       indent = {
  --         highlight = {
  --           'CursorColumn',
  --           'Whitespace',
  --         },
  --         char=""
  --       },
  --       whitespace = {
  --         highlight = {
  --           "CursorColumn",
  --           "Whitespace",
  --         },
  --         remove_blankline_trail = false,
  --       },
  --       scope = { enabled = false },
  --     })
  --   end,
  -- },
  {
    'echasnovski/mini.nvim',
    -- lazy = false,
    event = 'VeryLazy',
    -- version = 'false',
    config = function()
      -- require("mini.init").setup()
      require("mini.animate").setup()
      require("mini.basics").setup()
      require('mini.misc').setup()
      require('mini.completion').setup()
      require('mini.cursorword').setup()
      require('mini.extra').setup()
      require('mini.hipatterns').setup()
      -- require('mini.hues').setup()
      require('mini.trailspace').setup()
      require('mini.doc').setup()
      require('mini.ai').setup()
      -- require('mini.base16').setup()
    end
  },

  { "MunifTanjim/nui.nvim", lazy=false },
  -- }}}
  -- lazy.nvim
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  -- },
  -- {
  --   "folke/noice.nvim",
  --   lazy = false,
  --   opts = function()
  --     require('noice.nvim').setup({})
  --   end,
  -- },
  {
    -- "numiras/semshi",
    "wookayin/semshi", -- use a maintained fork
    ft = { "python", "ipython", "quarto", "markdown", "pandoc" },
    -- lazy = false,
    -- ft = "python",
    build = ":UpdateRemotePlugins",
    init = function()
      -- Disabled these features better provided by LSP or other more general plugins
      vim.g["semshi#error_sign"] = false
      vim.g["semshi#simplify_markup"] = false
      vim.g["semshi#mark_selected_nodes"] = false
      vim.g["semshi#update_delay_factor"] = 0.001

      -- This autocmd must be defined in init to take effect
      vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        group = vim.api.nvim_create_augroup("SemanticHighlight", {}),
        callback = function()
          -- Only add style, inherit or link to the LSP's colors
          vim.cmd([[
              highlight! semshiGlobal gui=italic
              highlight! semshiImported gui=bold
              highlight! link semshiParameter @lsp.type.parameter
              highlight! link semshiParameterUnused DiagnosticUnnecessary
              highlight! link semshiBuiltin @function.builtin
              highlight! link semshiAttribute @attribute
              highlight! link semshiSelf @lsp.type.selfKeyword
              highlight! link semshiUnresolved @lsp.type.unresolvedReference
              ]])
        end,
      })
    end,
  },

  {
    "hiphish/rainbow-delimiters.nvim",
    lazy=false,
  },

  -- {
  --   'hiphish/rainbow-delimiters.nvim',
  --   lazy = false,
  --   config = function()
  --     require("rainbow-delimiters.setup").setup({
  --       local_rainbow_delimiters = require 'rainbow-delimiters',
  --       strategy = {
  --         [''] = require('rainbow-delimiters').strategy['global'],
  --         vim = require('rainbow-delimiters').strategy['local'],
  --       },
  --       query = {
  --         [''] = 'rainbow-delimiters',
  --         lua = 'rainbow-blocks',
  --       },
  --       highlight = {
  --         'RainbowDelimiter00',
  --         'RainbowDelimiter01',
  --         'RainbowDelimiter02',
  --         'RainbowDelimiter03',
  --         'RainbowDelimiter04',
  --         'RainbowDelimiter05',
  --         'RainbowDelimiter06',
  --       },
  --       -- local hooks = require "ibl.hooks",
  --       -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  --       --     vim.api.nvim_set_hl(0, 'RainbowDelimiter00', { bg = "#E06C75" })
  --       --     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  --       --     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  --       --     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  --       --     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  --       --     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  --       --     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  --       --   end),
  --       -- vim.g.rainbow_delimiters = { highlight = highlight },
  --       -- require("ibl").setup({ scope = { highlight = highlight } }),
  --       -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  --     })
  --   end,
  -- },
  {
    'mvllow/modes.nvim',
    lazy = false,
    config = function()
      require('modes').setup({
        colors = {
          copy = "#AE81FF",
          delete = "#FF7575",
          insert = "#222222",
          visual = "#FFEE58",
        },
        -- Set opacity for cursorline and number background
        line_opacity = 0.15,
        -- Enable cursor highlights
        set_cursor = true,
        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,
        -- Enable line number highlights to match cursorline
        set_number = true,
        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
      })
    end,
  },

  {
    "folke/neodev.nvim",
    opts = {},
  },

  {
    'lukas-reineke/headlines.nvim',
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "markdown", "norg", "org", "qmd", "quarto", "rmd" },
    opts = {},
    config = function()
      -- require("headlines").setup {
      --   quarto = {
      --     query = vim.treesitter.query.parse(
      --       "markdown", [[
      --           (atx_heading [
      --               (atx_h1_marker)
      --               (atx_h2_marker)
      --               (atx_h3_marker)
      --               (atx_h4_marker)
      --               (atx_h5_marker)
      --               (atx_h6_marker)
      --           ] @headline)
      --           (thematic_break) @dash
      --           (fenced_code_block) @codeblock
      --           (block_quote_marker) @quote
      --           (block_quote (paragraph (inline (block_continuation) @quote)))
      --       ]]
      --     ),
      --     headline_highlights = { "Headline1", "Headline2", "Headline3 "},
      --     codeblock_highlight = "CodeBlock",
      --     treesitter_language = "markdown",
      --     -- headline_highlights = { "Headline" },
      --     dash_highlight = "Dash",
      --     dash_string = "-",
      --     quote_highlight = "Quote",
      --     quote_string = "┃",
      --     fat_headlines = true,
      --     fat_headline_upper_string = "▃",
      --     fat_headline_lower_string = "🬂",
      --   },
      --   markdown = {
      --     query = vim.treesitter.query.parse(
      --       "markdown", [[
      --           (atx_heading [
      --               (atx_h1_marker)
      --               (atx_h2_marker)
      --               (atx_h3_marker)
      --               (atx_h4_marker)
      --               (atx_h5_marker)
      --               (atx_h6_marker)
      --           ] @headline)
      --           (thematic_break) @dash
      --           (fenced_code_block) @codeblock
      --           (block_quote_marker) @quote
      --           (block_quote (paragraph (inline (block_continuation) @quote)))
      --       ]]
      --     ),
      --     headline_highlights = { "Headline1", "Headline2", "Headline3 "},
      --     codeblock_highlight = "CodeBlock",
      --     treesitter_language = "markdown",
      --     -- headline_highlights = { "Headline" },
      --     dash_highlight = "Dash",
      --     dash_string = "-",
      --     quote_highlight = "Quote",
      --     quote_string = "┃",
      --     fat_headlines = true,
      --     fat_headline_upper_string = "▃",
      --     fat_headline_lower_string = "🬂",
      --   },
      -- }
    end
  },

  -- {
  --   "uga-rosa/ccc.nvim",
  --   lazy=false,
  --   config = function()
  --     local ColorInput = require("ccc.input")
  --     local convert = require("ccc.utils.convert")
  --
  --     local RgbHslCmykInput = setmetatable({
  --         name = "RGB/HSL/CMYK",
  --         max = { 1, 1, 1, 360, 1, 1, 1, 1, 1, 1 },
  --         min = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  --         delta = { 1 / 255, 1 / 255, 1 / 255, 1, 0.01, 0.01, 0.005, 0.005, 0.005, 0.005 },
  --         bar_name = { "R", "G", "B", "H", "S", "L", "C", "M", "Y", "K" },
  --     }, { __index = ColorInput })
  --
  --     function RgbHslCmykInput.format(n, i)
  --         if i <= 3 then
  --             -- RGB
  --             n = n * 255
  --         elseif i == 5 or i == 6 then
  --             -- S or L of HSL
  --             n = n * 100
  --         elseif i >= 7 then
  --             -- CMYK
  --             return ("%5.1f%%"):format(math.floor(n * 200) / 2)
  --         end
  --         return ("%6d"):format(n)
  --     end
  --
  --     function RgbHslCmykInput.from_rgb(RGB)
  --         local HSL = convert.rgb2hsl(RGB)
  --         local CMYK = convert.rgb2cmyk(RGB)
  --         local R, G, B = unpack(RGB)
  --         local H, S, L = unpack(HSL)
  --         local C, M, Y, K = unpack(CMYK)
  --         return { R, G, B, H, S, L, C, M, Y, K }
  --     end
  --
  --     function RgbHslCmykInput.to_rgb(value)
  --         return { value[1], value[2], value[3] }
  --     end
  --
  --     function RgbHslCmykInput:_set_rgb(RGB)
  --         self.value[1] = RGB[1]
  --         self.value[2] = RGB[2]
  --         self.value[3] = RGB[3]
  --     end
  --
  --     function RgbHslCmykInput:_set_hsl(HSL)
  --         self.value[4] = HSL[1]
  --         self.value[5] = HSL[2]
  --         self.value[6] = HSL[3]
  --     end
  --
  --     function RgbHslCmykInput:_set_cmyk(CMYK)
  --         self.value[7] = CMYK[1]
  --         self.value[8] = CMYK[2]
  --         self.value[9] = CMYK[3]
  --         self.value[10] = CMYK[4]
  --     end
  --
  --     function RgbHslCmykInput:callback(index, new_value)
  --         self.value[index] = new_value
  --         local v = self.value
  --         if index <= 3 then
  --             local RGB = { v[1], v[2], v[3] }
  --             local HSL = convert.rgb2hsl(RGB)
  --             local CMYK = convert.rgb2cmyk(RGB)
  --             self:_set_hsl(HSL)
  --             self:_set_cmyk(CMYK)
  --         elseif index <= 6 then
  --             local HSL = { v[4], v[5], v[6] }
  --             local RGB = convert.hsl2rgb(HSL)
  --             local CMYK = convert.rgb2cmyk(RGB)
  --             self:_set_rgb(RGB)
  --             self:_set_cmyk(CMYK)
  --         else
  --             local CMYK = { v[7], v[8], v[9], v[10] }
  --             local RGB = convert.cmyk2rgb(CMYK)
  --             local HSL = convert.rgb2hsl(RGB)
  --             self:_set_rgb(RGB)
  --             self:_set_hsl(HSL)
  --         end
  --     end
  --     local ccc = require("ccc")
  --     ccc.setup({
  --         inputs = {
  --             RgbHslCmykInput,
  --         },
  --         highlighter = {
  --             auto_enable = true,
  --             lsp = true,
  --         },
  --     })
  --   end
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup({
        opts = {},
        -- stylua: ignore
        -- keys = {
        --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        -- },
      })
    end
  },

  { "mbbill/undotree", lazy=false },
  { "kosayoda/nvim-lightbulb", lazy=false },
  { "machakann/vim-sandwich", lazy=false },
  { 'vim-python/python-syntax', ft={"python"} },
  { 'Vimjas/vim-python-pep8-indent', ft={"python"} },
  -- { 'rafcamlet/nvim-luapad', },
  { 'rafi/awesome-vim-colorschemes', lazy=false},
  { 'tpope/vim-repeat', lazy=false },
  { 'kreskij/Repeatable.vim', lazy=false },
  {
    'chentoast/marks.nvim',
    lazy = false,
    config = function()
      require('marks').setup({
        default_mappings = true,
        -- builtin_marks = {'.', '<', '>', '^'},
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        bookmark_0 = { sign = "⚑", virt_text = "hello world" },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    cmd="TroubleToggle",
    lazy=false,
    config = function()
     dofile(vim.g.base46_cache .. "trouble")
     require("trouble").setup()
    end
  },

  {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = {"markdown", "pandoc"},
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
      })
    end,
  },

  { 'rrethy/vim-illuminate', lazy=false },
  {
    'Exafunction/codeium.vim',
    lazy = false,
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    -- lazy = false,
    config = function()
      -- require('nvim-notify').setup()
      require('notify').setup()
      vim.notify = require("notify")
      require('telescope').load_extension('notify')
    end
  },

  {
    "RRethy/vim-hexokinase",
    run = "make hexokinase",
  },

  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue or blue
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = true, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "foreground", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = true, -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = true, parsers = { "css" }, }, -- Enable sass colors
          -- virtualtext = "•",
          virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      }
    end
  },

  -- ["folke/which-key.nvim"] = {
  --   disable=false,
  --   config = function()
  --     require("plugins.configs.whichkey")
  --     local present, wk = pcall(require, "which-key")
  --     if not present then
  --       return
  --     end
  --     wk.register(
  --       {
  --         -- add group
  --         ["<leader>"] = {
  --           p = {
  --             name="+Plugins",
  --             u = { ":Lazy update<CR>", "Update Plugins"},
  --             s = { ":Lazy sync<CR>", "Sync Plugins"},
  --           },
  --         }
  --       }
  --     )
  --   end,
  --   setup = function()
  --     require("core.utils").load_mappings "whichkey"
  --   end,
  -- },
}

return plugins
