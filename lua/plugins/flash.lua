return {
  "folke/flash.nvim",
  event = "VeryLazy",

  config = function()
    require("flash").setup({
      modes = {
        search = {
          enabled = true,
        },
        char = {
          enabled = true,
        },
      },
    })

local map = vim.keymap.set

map("n", "<leader>j", function()
  require("flash").jump()
end, { desc = "Flash: jump to text" })

map("n", "<leader>J", function()
  require("flash").treesitter()
end, { desc = "Flash: jump by structures" })

map("x", "<leader>j", function()
  require("flash").jump()
end, { desc = "Flash: jump (visual)" })

map("o", "<leader>j", function()
  require("flash").jump()
end, { desc = "Flash: jump (operator)" })
  end,
}

