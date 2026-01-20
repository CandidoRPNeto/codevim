vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autochdir = false
vim.opt.fillchars = { eob = " " }
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local cwd = vim.fn.getcwd()
    vim.fn.chdir(cwd)
  end,
})

vim.opt.statusline = "%F"
