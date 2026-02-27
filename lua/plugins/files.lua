return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
          git_ignored = false
        },
        update_root = false,
        git = {
          enable = false,
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          -- carrega os mappings padrão do nvim-tree
          api.config.mappings.default_on_attach(bufnr)

          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end

          -- sobrescreve l e h (SEM deletar antes)
          vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
          vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        end,
      })
      
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.fn.isdirectory(vim.g.nvim_initial_cwd or vim.fn.getcwd()) == 1 then
            require("nvim-tree.api").tree.change_root(vim.g.nvim_initial_cwd or vim.fn.getcwd())
          end
        end,
        once = true,
      })
    end,
  },

  {
    "tamago324/lir.nvim",
    config = true,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  },
}
