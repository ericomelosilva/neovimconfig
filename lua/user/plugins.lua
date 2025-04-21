return {
  -- Core utilities
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  --nvim tree
  { "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- load it on demand when you hit <Leader>e
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  config = function()
   require("nvim-tree").setup({
  -- === Basic view options ===
  view = {
    side            = "left",
    width           = 30,
    number          = false,
    relativenumber  = false,
    cursorline      = true,
    signcolumn      = "no",
  },

  -- === Renderer tweaks ===
  renderer = {
    -- Hide the root folder completely
    root_folder_label = false,
    icons = {
      show = { file = true, folder = true, git = true },
    },
  },

  -- === Filters & actions ===
  filters = {
    dotfiles = false,
    custom   = { "^.git$" },
  },
  actions = {
    open_file = {
      quit_on_open   = false,
      resize_window  = true,
    },
  },

  -- === Keybindings ===
  -- This replaces the old `view.mappings` block:
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    -- load all the default keymaps
    api.config.mappings.default_on_attach(bufnr)

    -- add or override mappings here, for example:
    local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
    vim.keymap.set("n", "<CR>", api.node.open.edit,           opts)  -- Enter to open
    vim.keymap.set("n", "v",    api.node.open.vertical,       opts)  -- v to vsplit
    vim.keymap.set("n", "h",    api.node.open.horizontal,     opts)  -- h to split
    vim.keymap.set("n", "C",    api.node.navigate.parent_close, opts)  -- C to collapseend
    end,
    })

   require("nvim-tree").setup({

  view = { width = 30, side = "left" },
  respect_buf_cwd = true,
  hijack_netrw     = true,
  })

   vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("NvimTreeOpen")   -- open the tree
      vim.cmd("wincmd l")       -- move focus right
      require("alpha").start(true)  -- then show dashboard
    end
  end,
  })
    end,
    },


  -- Fuzzy finders
  { "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    lazy = false,
    dependencies = { "plenary.nvim" },
    config = function() require("user.telescope") end,
  },
  { "junegunn/fzf.vim",       build = function() vim.fn["fzf#install"]() end },

  -- Treesitter for smart syntax
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("user.treesitter") end,
  },

  -- Snippets
  { "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function() require("user.snippets") end,
  },

  -- LaTeX support
  { "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function() require("user.vimtex") end,
  },

  -- LSP + completion
  { "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("user.lsp") end,
  },
  { "hrsh7th/nvim-cmp",           event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() require("user.completion") end,
  },

  -- Language plugins
  { "rust-lang/rust.vim",        ft = "rust"    },
  { "jalvesaq/Nvim-R",           ft = "r"       },
  { "neovimhaskell/haskell-vim", ft = "haskell" },
  { "Julian/lean.nvim",          ft = "lean"    },

  --Colorschemes
  { "catppuccin/nvim",          name = "catppuccin",    lazy = false, priority =    100, config = function()
    vim.cmd("colorscheme catppuccin-mocha")
    end 
  },
  { "folke/tokyonight.nvim",    lazy = true,  config = function()
    vim.g.tokyonight_style = "storm"
    end 
  },
  { "ellisonleao/gruvbox.nvim", lazy = true },

  -- UI plugins

  { "goolord/alpha-nvim",
  lazy = false,  -- load immediately
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dash  = require("alpha.themes.dashboard")
    local fn    = vim.fn

    -- 1) Read your pre‑generated ASCII art from aker.txt
    local art = fn.readfile(fn.expand("~/.config/nvim/ascii/aker.txt"))
    dash.section.header.val = art

    -- 2) Dashboard buttons
    dash.section.buttons.val = {
      dash.button("e", "  New file",    ":ene | startinsert<CR>"),
      dash.button("f", "  Find file",   ":Telescope find_files<CR>"),
      dash.button("r", "  Recent files",":Telescope oldfiles<CR>"),
      dash.button("q", "  Quit NVIM",   ":qa<CR>"),
    }

    -- 3) Layout: padding → ASCII art → padding → buttons
    dash.config.layout = {
      { type = "padding", val = 1 },
      dash.section.header,
      { type = "padding", val = 2 },
      dash.section.buttons,
    }

    -- 4) Apply the dashboard configuration
    alpha.setup(dash.config)
  end,
  },


  --lualine
  { "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup{
      options = {
        icons_enabled = true,
        theme         = "catppuccin",
        component_separators = "|",
        section_separators   = "",
      },
      sections = {
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    }
  end,
  },

  { "akinsho/bufferline.nvim",
    event = "BufReadPre",
    dependencies = "nvim-web-devicons",
    config = function()
      require("bufferline").setup{
        options = {
          diagnostics = "nvim_lsp",
          offsets     = {{ filetype = "NvimTree", text = "Explorer", padding = 1 }  },
        },
      }
    end,
  },

  { "lukas-reineke/indent-blankline.nvim",
  -- tell Lazy to load the new entry point:
  main  = "ibl",
  event = "BufReadPre",
  -- pass your settings via `opts` so Lazy.nvim will do `require("ibl").setup(opts)`
  opts = {
    indent = {
      char    = "│",                -- your guide character
      tab_char= "│",                -- how tabs are shown
    },
    exclude = {
      filetypes = { "dashboard", "NvimTree", "packer" },
      buftypes  = { "terminal" },
    },
    scope = {
      enabled = true,               -- highlight the current indent scope
      show_start = false,           -- turn off the dashed start‑line
    },
    -- if you had `show_trailing_blankline_indent = false` in v2, 
    -- you can now omit it (the default is off) or add it under `indent`:
    -- indent = { show_trailing_blankline_indent = false, … },
  },
},


  { "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup{ timeout = true }
  end,
  },

}
