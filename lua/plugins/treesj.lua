return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },

  config = function()
    require("treesj").setup({
      use_default_keymaps = false, -- vamos definir os nossos
      max_join_length = 150,       -- evita linhas gigantes
      check_syntax_error = true,
      notify = true,
    })

    local map = vim.keymap.set

    -- Split (expandir)
    map("n", "<leader>sj", function()
      require("treesj").split()
    end, { desc = "Split estrutural (TreesJ)" })

    -- Join (compactar)
    map("n", "<leader>sk", function()
      require("treesj").join()
    end, { desc = "Join estrutural (TreesJ)" })

    -- Toggle automático
    map("n", "<leader>st", function()
      require("treesj").toggle()
    end, { desc = "Toggle split/join (TreesJ)" })
  end,
}

