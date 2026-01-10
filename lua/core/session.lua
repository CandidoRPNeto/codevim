vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "globals",
}

local session_dir = vim.fn.stdpath("data") .. "/sessions"

vim.fn.mkdir(session_dir, "p")

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local cwd = vim.fn.getcwd():gsub("/", "%%")
    local session = session_dir .. "/" .. cwd .. ".vim"
    vim.cmd("mksession! " .. session)
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local cwd = vim.fn.getcwd():gsub("/", "%%")
    local session = vim.fn.stdpath("data") .. "/sessions/" .. cwd .. ".vim"

    if vim.fn.filereadable(session) == 1 then
      vim.cmd("source " .. session)
    end
  end,
})

