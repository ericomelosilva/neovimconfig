local lsp = require("lspconfig")
lsp.pyright.setup{}            -- Python
lsp.r_language_server.setup{}  -- R
lsp.rust_analyzer.setup{}      -- Rust
lsp.hls.setup{}                -- Haskell
lsp.leanls.setup{}            -- Lean
lsp.tinymist.setup{
	settings = {
		exportPdf = "onSave",
	},
}           -- Typst


