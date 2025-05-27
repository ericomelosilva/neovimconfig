-- ── <leader>tc  ➜  save, compile with Tinymist, then open/refresh PDF ──
vim.keymap.set("n", "<leader>tc", function()
  vim.cmd("write")                                  

  local src  = vim.fn.expand("%")                    
  local pdf  = vim.fn.expand("%:r") .. ".pdf"       


    vim.fn.jobstart({ "tinymist", "compile", src, pdf }, {
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify("Tinymist compile failed", vim.log.levels.ERROR)
        return
      end


	vim.fn.jobstart(
        { "sh", "-c", "pgrep -fx 'zathura " .. pdf ..
                      "' >/dev/null || (zathura '" .. pdf .. "' &)" },
        { detach = true }
      )
    end,
  })
end, { buffer = true, desc = "Typst → PDF → view" })

