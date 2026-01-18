vim.lsp.config.intelephense = {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
}

vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
}

vim.lsp.config.rust_analyzer = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
}

vim.lsp.config.cssls = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
}

vim.lsp.config.gdscript = {
  cmd = { "nc", "-l", "6005" },
  filetypes = { "gd", "gdscript", "gdscript3" },
  root_dir = vim.fs.root(0, { "project.godot" }),
}

vim.lsp.enable("intelephense", "ts_ls", "rust_analyzer", "cssls", "gdscript")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Documentation" })

vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })
