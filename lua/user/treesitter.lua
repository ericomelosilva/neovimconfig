-- lua/user/treesitter.lua
local parsers = require("nvim-treesitter.parsers").get_parser_configs()

parsers.lean = {
  install_info = {
    -- git repo with the Lean grammar
    url = "https://github.com/Julian/tree-sitter-lean",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "lean",
}

require("nvim-treesitter.configs").setup{
  ensure_installed = { "python","rust","r","haskell","lean","lua","markdown" },
  highlight        = { enable = true },
  indent           = { enable = true },
}

