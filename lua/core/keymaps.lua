vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- busca
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")

-- árvore
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- formatar arquivo inteiro
map("n", "<leader>=", "gg=G")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>sr", function()
  require("spectre").open_file_search()
end, { desc = "Replace in file" })

vim.keymap.set("n", "<leader>sR", function()
  require("spectre").open()
end, { desc = "Replace in project" })

vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", {
  desc = "Next buffer",
})

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", {
  desc = "Previous buffer",
})

vim.keymap.set("n", "<leader>bd", function()
    local current = vim.api.nvim_get_current_buf()

    -- tenta ir para o próximo buffer normal
    vim.cmd("bnext")

    -- se ainda estiver no mesmo buffer, tenta o anterior
    if vim.api.nvim_get_current_buf() == current then
      vim.cmd("bprevious")
    end

    -- agora fecha o buffer original
    vim.cmd("bdelete " .. current)
  end, {
  desc = "Colose this buffer",
})


vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", {
  desc = "Close other buffers",
})

vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", {
  desc = "Close buffers to the right",
})

vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", {
  desc = "Close buffers to the left",
})

-- Movimento horizontal inteligente (wrap) para h/l e setas
vim.opt.whichwrap:append("h,l,<,>,[,]")

-- Não copiar ao colar em seleção (paste sem poluir o yank)
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })
vim.keymap.set("v", "P", '"_dP', { noremap = true, silent = true })

-- Não copiar ao deletar
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "c", '"_c')

-- Mantém D, C funcionando corretamente
vim.keymap.set("n", "D", '"_D')
vim.keymap.set("n", "C", '"_C')

-- Manter seleção após indent
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- Manter seleção após formatação
vim.keymap.set("v", "=", "=gv", { noremap = true, silent = true })

-- Manter seleção após shift de linhas (J/K)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Remove o mapping específico de Insert mode
pcall(vim.keymap.del, "i", "<Space>t")

-- Navegar entre mudanças
vim.keymap.set("n", "m", function()
  require("gitsigns").next_hunk()
end, { desc = "Next hunk" })

vim.keymap.set("n", "<S-m>", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previus hunk" })

-- Ver diff do arquivo
vim.keymap.set("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "File diff" })

vim.keymap.set("n", "<leader>h", function()
  vim.cmd("CodeVimHelp")
end, {
  desc = "Open CodeVim help",
})

vim.keymap.set("n", "<leader>he", function()
  vim.cmd("CodeVimHelp en")
end, {
  desc = "Open CodeVim help (English)",
})

-- Recortar (deletar e copiar)
vim.keymap.set("n", "<leader>x", "yydd", { desc = "Cut line" })
vim.keymap.set("v", "<leader>x", "ygvd", { desc = "Cut selection" })
