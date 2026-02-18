local M = {}

function M.setup()
  vim.keymap.set("v", "/", "y/<C-R>\"<CR>", { noremap = true, silent = false })

  vim.keymap.set("v", "f", function()
    vim.cmd("normal! y")
    local selection = vim.fn.getreg('"')
    if selection and #selection > 0 then
      require("telescope.builtin").live_grep({
        default_text = selection,
      })
    end
  end, { noremap = true })

  vim.keymap.set("n", "ff", "viw", { noremap = true })
end

return M
