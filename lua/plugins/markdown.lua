return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = { "markdown" },
  config = function()
  -- Preview normal
  vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", {
    desc = "Markdown: abrir preview",
  })

  -- Parar preview
  vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", {
    desc = "Markdown: parar preview",
  })

  -- Alternar preview
  vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", {
    desc = "Markdown: alternar preview",
  })
  end,
}
