if not vim.g.nvim_initial_cwd then
  vim.g.nvim_initial_cwd = vim.fn.getcwd()
end

local function get_project_root()
  local root_patterns = { ".git", "package.json", "Cargo.toml", "go.mod", "pyproject.toml", ".svn", ".hg", "composer.json", "Makefile", ".project" }
  
  local cwd = vim.g.nvim_initial_cwd or vim.fn.getcwd()
  for _, pattern in ipairs(root_patterns) do
    local match = vim.fs.find(pattern, { upward = true, limit = 1, path = cwd })[1]
    if match then
      return vim.fs.dirname(match)
    end
  end
  
  return cwd
end

vim.g.project_root = get_project_root()

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
        cwd = vim.g.project_root,
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },

      pickers = {
        find_files = {
          hidden = false,
          no_ignore = true,
          cwd = vim.g.project_root,
        },
        live_grep = {
          previewer = true,
          cwd = vim.g.project_root,
        },
      },
    })
  end,
}

