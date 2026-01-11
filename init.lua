
-- ~/.config/codevim/init.lua
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.lazy")
require("core.lsp")
require("core.commands")


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local modes = { "i", "t" } -- Insert e Terminal
    local keys = { "<Space>t", "<Space>q", "<Space>w" } -- mapeamentos perigosos
    for _, mode in ipairs(modes) do
      for _, k in ipairs(keys) do
        pcall(vim.keymap.del, mode, k)
      end
    end
  end,
})

