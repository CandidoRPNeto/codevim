return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = { {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "windwp/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },
  }, },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "rust_analyzer",
        "cssls",
        "html",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        lua_ls = function()
          require("lspconfig").lua_ls.setup({})
        end,
        ts_ls = function()
          require("lspconfig").ts_ls.setup({
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          })
        end,
        pyright = function()
          require("lspconfig").pyright.setup({
            cmd = { "pyright-langserver", "--stdio" },
            filetypes = { "python" },
          })
        end,
        rust_analyzer = function()
          require("lspconfig").rust_analyzer.setup({
            cmd = { "rust-analyzer" },
            filetypes = { "rust" },
          })
        end,
        cssls = function()
          require("lspconfig").cssls.setup({
            cmd = { "vscode-css-language-server", "--stdio" },
            filetypes = { "css", "scss" },
          })
        end,
        html = function()
          require("lspconfig").html.setup({
            cmd = { "vscode-html-language-server", "--stdio" },
            filetypes = { "html" },
          })
        end,
      },
    })
    -- Godot (gdscript) LSP — fora do Mason
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    lspconfig.gdscript.setup({
      cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
      filetypes = { "gd", "gdscript", "gdscript3" },
      root_dir = util.root_pattern("project.godot"),
      autostart = true,
    })

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    cmp.setup({
      snippet = { expand = function(args) luasnip.lsp_expand(args.body) end, },
      mapping = cmp.mapping.preset
          .insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping
                .complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),
      sources = cmp
          .config.sources({ { name = "nvim_lsp" }, { name = "luasnip" }, }, { { name = "buffer" }, { name = "path" }, }),
    })
    cmp.setup.cmdline({ "/", "?" }, { mapping = cmp.mapping.preset.cmdline(), sources = { { name = "buffer" }, }, })
    cmp.setup.cmdline(":",
      {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" }, },
          { { name = "cmdline" }, }),
      })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
  end,
}
