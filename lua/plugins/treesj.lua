return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },

  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      max_join_length = 150,
      check_syntax_error = true,
      notify = true,
    })

    local map = vim.keymap.set

    map("n", "<leader>sj", function()
      require("treesj").split()
    end, { desc = "Structural split (TreesJ)" })

    map("n", "<leader>sk", function()
      require("treesj").join()
    end, { desc = "Structural join (TreesJ)" })

    map("n", "<leader>st", function()
      require("treesj").toggle()
    end, { desc = "Toggle split/join (TreesJ)" })
  end,
}

