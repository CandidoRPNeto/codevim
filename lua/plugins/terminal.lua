return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        open_mapping = [[<S-Tab>]],
        size = 15,
        float_opts = {
          border = "rounded",
          winblend = 0,
        },
      })

vim.keymap.set("n", "<S-q>", "<cmd>ToggleTerm 1<CR>", { desc = "Terminal 1" })
vim.keymap.set("n", "<S-w>", "<cmd>ToggleTerm 2<CR>", { desc = "Terminal 2" })
vim.keymap.set("n", "<S-e>", "<cmd>ToggleTerm 3<CR>", { desc = "Terminal 3" })

    end,
  },
}
