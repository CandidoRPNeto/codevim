return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          php = { "php_cs_fixer" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          rust = { "rustfmt" },
        },
      })
    end,
  },
}
