--set leader key

vim.g.mapleader		= ","
-- toggle file‑tree with <Leader>e
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
-- next/prev buffer (bufferline style)
vim.keymap.set("n", "<leader>]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>", { desc = "Close buffer" })


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- speed up startup
vim.loader.enable()

-- point Lazy at your plugin list
require("lazy").setup("user.plugins", {
  defaults    = { lazy = true },
  install     = { colorscheme = { "tokyonight", "gruvbox" } },
  checker     = { enabled = true },  -- auto‑update checks
})






