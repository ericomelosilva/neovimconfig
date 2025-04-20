require("telescope").setup{ defaults = {
  file_ignore_patterns = { "node_modules", ".git" },
  layout_strategy      = "flex",
}}
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

