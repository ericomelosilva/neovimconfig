-- ~/.config/nvim/snippets/latex.lua
local ls = require("luasnip")
local s, i, t = ls.snippet, ls.insert_node, ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

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

ls.add_snippets("tex", {
  s("probset", fmt([[
\documentclass[{}]{{exam}}
\usepackage{{amsfonts,amssymb,amsmath,amsthm}}
\usepackage{{graphicx}}
\usepackage{{systeme}}
\usepackage{{pgf,tikz,pgfplots}}
\usepackage{{xcolor}}
\pgfplotsset{{compat=1.15}}
\usepgfplotslibrary{{fillbetween}}
\usepackage{{mathrsfs}}
\usetikzlibrary{{arrows,calc}}

\pagestyle{{headandfoot}}

\firstpageheader{{CW/HW}}{{}}{{}}
\runningheader{{}}{{}}{{Page \thepage\ of \numpages}}
\runningheadrule
\firstpagefooter{{}}{{}}{{}}
\runningfooter{{}}{{}}{{}}

\begin{{document}}

\begin{{questions}}
  {}
\end{{questions}}

\end{{document}}
]], {
    -- [1] = class options
    i(1, "11pt,addpoints"),
    -- [2] = place to put your question snippets
    i(2, "% your \\question blocks here")
  }))
  ,

  -- single question block with an image
  s("q", fmt([[
\question {}
\begin{{flushleft}}
  \includegraphics[scale={}]{}
\end{{flushleft}}
]], {
    -- [1] = question prompt (you can leave blank or put text)
    i(1, "\\textcolor{white}{.}"),
    -- [2] = scale factor
    i(2, "0.7"),
    -- [3] = filename (without extension)
    i(3, "prob  ")
  })
  ),
  })


ls.add_snippets("tex", {
  -- poetry template
  s("poem", fmt([[
\documentclass[{}]{{article}}
\usepackage[T1]{{fontenc}}
\usepackage[utf8]{{inputenc}}
% Garamond via garamondx; if you prefer xelatex:
% \usepackage{{fontspec}}
% \setmainfont{{EB Garamond}}
\usepackage{{garamondx}}
\usepackage{{setspace}}
\setstretch{{{}}}

\pagestyle{{empty}}

\begin{{document}}

{}

\end{{document}}
]], {
    i(1, "11pt"),
    i(2, "1.15"),
    i(3, "% start typing your poem…")
  })
),
})

--biochem note template
-- Trigger: bcnote
ls.add_snippets("tex", {
  s("bcnote", fmt([[
\documentclass[11pt,a4paper]{{article}}
\usepackage[utf8]{{inputenc}}
\usepackage[T1]{{fontenc}}
\usepackage{{lmodern}}
\usepackage{{amsmath,amssymb}}
\usepackage{{geometry}}
\geometry{{margin=1in}}

\title{{Biochemistry Notes: {}}}
\author{{{}}}
\date{{\today}}

\begin{{document}}
\maketitle
\tableofcontents
\vspace{{1em}}

\section{{Introduction: {}}}
{}

\section{{Key Concepts}}
{}

\section{{Mechanisms}}
{}

\section{{Examples}}
{}

\end{{document}}
]], {
    i(1, "Voet Chapter X"),
    i(2, "Your Name"),
    i(3, "Overview of chapter"),
    i(4, "Introductory notes..."),
    i(5, "Key concepts..."),
    i(6, "Mechanisms details..."),
    i(7, "Example problems...")
  }))
})
