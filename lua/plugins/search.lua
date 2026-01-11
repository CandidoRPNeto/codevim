return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {},
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.55,
        },
        preview = {
          timeout = 200,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },

      pickers = {
        find_file = {
          hidden = false,
          no_ignore = true
        },
        live_grep = {
          previewer = true,
        },
      },
    })
  end,
}

