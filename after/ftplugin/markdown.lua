-- ~/.config/nvim/after/ftplugin/markdown.lua
vim.g.vim_markdown_conceal             = 1
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_conceal_bracket_link = 1
vim.g.vim_markdown_conceal_inline_url   = 1

vim.opt_local.conceallevel  = 2    -- 2 = fully hide the markers
vim.opt_local.concealcursor = 'n'  -- only conceal in Normal mode

