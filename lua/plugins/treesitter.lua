return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.config",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "gdscript",
      "godot_resource",
      "gdshader",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "rust",
      "scss",
      "toml",
      "typescript",
      "query",
      "vim",
      "vimdoc",
      "yaml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'markdown' }
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["<leader>fn"] = "@function.outer",
          ["<leader>cn"] = "@class.outer",
        },
        goto_next_end = {
          ["<leader>fN"] = "@function.outer",
          ["<leader>cN"] = "@class.outer",
        },
        goto_previous_start = {
          ["<leader>fp"] = "@function.outer",
          ["<leader>cp"] = "@class.outer",
        },
        goto_previous_end = {
          ["<leader>fP"] = "@function.outer",
          ["<leader>cP"] = "@function.outer",
        },
      },
    },
  },
}
