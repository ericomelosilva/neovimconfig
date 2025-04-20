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
    require("nvim-tree").setup {
      disable_netrw       = false,  -- don’t fall back to netrw
      hijack_netrw        = true,   -- take over directory buffers
      update_focused_file = {
        enable = true,              -- keep cursor file in view
      },
      view = {
        side      = "left",         -- left-hand side
        width     = 30,             -- tree width in chars
        hide_root_folder = false,
        mappings = {
          list = {
            { key = {"<CR>", "o"}, action = "edit" },
            { key = "e",           action = "edit" },
            { key = "v",           action = "vsplit" },
            { key = "h",           action = "split" },
            { key = "C",           action = "close_node" },
            { key = "R",           action = "refresh" },
          },
        },
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { "^.git$" },
      },
      actions = {
        open_file = {
          quit_on_open = false,      -- keep tree open
          resize_window = true,
        },
      },
    }
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
