return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",

        -- NvimTree integração
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorador",
            highlight = "Directory",
            separator = true,
          },
        },

        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
      },
    })
  end,
}

