return {
  "echasnovski/mini.surround",
  version = false,

  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "sa",        -- Adicionar surround
        delete = "sd",     -- Remover surround
        replace = "sr",    -- Substituir surround
        find = "sf",       -- Encontrar surround (direita)
        find_left = "sF",  -- Encontrar surround (esquerda)
        highlight = "sh",  -- Destacar surround
        update_n_lines = "sn", -- Atualizar linhas analisadas
      },
    })
  end,
}

