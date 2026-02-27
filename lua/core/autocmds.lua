vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    if vim.g.nvim_initial_cwd and vim.fn.isdirectory(vim.g.nvim_initial_cwd) == 1 then
      require("nvim-tree.api").tree.change_root(vim.g.nvim_initial_cwd)
    end
  end,
})