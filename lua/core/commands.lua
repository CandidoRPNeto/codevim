local config_dir = vim.fn.stdpath("config")
local doc_dir = config_dir .. "/doc"
local lang = vim.env.LANG:match("^pt") and "pt" or "en"
local help_file = doc_dir .. "/" .. lang .. "/codevim-" .. lang .. ".txt"

vim.opt.rtp:append(doc_dir .. "/" .. lang)

vim.api.nvim_create_user_command("CodeVimHelp", function(opts)
  local l = opts.fargs[1] or lang
  local hf = doc_dir .. "/" .. l .. "/codevim-" .. l .. ".txt"
  if vim.fn.filereadable(hf) == 1 then
    vim.cmd("edit " .. hf)
    vim.cmd("set ft=help")
  else
    vim.notify("Help file not found: " .. hf, vim.log.levels.ERROR)
  end
end, {
  desc = "Open CodeVim documentation",
  nargs = "?",
  complete = function()
    return {"pt", "en"}
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.cmd("helptags " .. doc_dir .. "/" .. lang)
  end,
})
