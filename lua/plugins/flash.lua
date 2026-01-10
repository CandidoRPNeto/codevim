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

    -- Jump para qualquer texto (estilo EasyMotion)
    map("n", "<leader>j", function()
      require("flash").jump()
    end, { desc = "Flash: pular para texto" })

    -- Jump com padrão Treesitter (funções, blocos, etc)
    map("n", "<leader>J", function()
      require("flash").treesitter()
    end, { desc = "Flash: pular por estruturas" })

    -- Flash em modo visual
    map("x", "<leader>j", function()
      require("flash").jump()
    end, { desc = "Flash: pular (visual)" })

    -- Flash baseado em Treesitter (operadores)
    map("o", "<leader>j", function()
      require("flash").jump()
    end, { desc = "Flash: pular (operator)" })
  end,
}

