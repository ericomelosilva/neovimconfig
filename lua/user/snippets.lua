local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load { paths = "~/.config/nvim/snippets/latex" }
vim.keymap.set({"i","s"}, "<C-k>", function() ls.expand_or_jump() end, {silent=true})
vim.keymap.set({"i","s"}, "<C-j>", function() ls.jump(-1)         end, {silent=true})

