-- ~/.config/nvim/snippets/latex.lua
local ls = require("luasnip")
local s, i, t = ls.snippet, ls.insert_node, ls.text_node

ls.add_snippets("tex", {
  s("doc", {
    t({ "\\documentclass{article}",
        "\\usepackage[utf8]{inputenc}",
        "\\usepackage{amsmath,amsthm,amssymb}",
        "\\title{" }), i(1, "Title"), t({ "}", "\\author{" }),
    i(2, "Erico"), t({ "}", "\\date{" }), i(3, "\\today"), t({ "}", "",
        "\\begin{document}",
        "\\maketitle", "" }),
    i(0),
    t({ "", "\\end{document}" }),
  }),
})

