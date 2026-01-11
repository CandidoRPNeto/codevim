return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = { "markdown" },
  config = function()
  vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", {
    desc = "Markdown: open preview",
  })

  vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", {
    desc = "Markdown: stop preview",
  })

  vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", {
    desc = "Markdown: toggle preview",
  })
  end,
}
