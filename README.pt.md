# 🚀 CodeVim

CodeVim é uma **configuração do Neovim**, criada para funcionar como uma IDE moderna, produtiva e previsível, inspirada em VS Code / JetBrains, mas mantendo a filosofia do Vim.

Este README serve como **manual de uso**, pensado para quem é esquecido (😄), e também para qualquer pessoa que queira abrir o CodeVim e **saber exatamente como tudo funciona**.

**Atalho de ajuda**: `Space + h` ou `:CodeVimHelp` para abrir a documentação dentro do Neovim (português). Use `:CodeVimHelp en` para a versão em inglês.

---

# 📦 Plugins Utilizados

## Interface / UI

* **alpha-nvim** – Tela inicial (dashboard)
* **bufferline.nvim** – Abas/buffers no topo
* **nvim-tree.lua** – Explorador de arquivos
* **nvim-web-devicons** – Ícones
* **nvim-colorizer.lua** – Visualização de cores inline
* **toggleterm.nvim** – Terminal integrado flutuante

## Busca e Navegação

* **telescope.nvim** – Busca de arquivos, texto e símbolos
* **telescope-fzf-native.nvim** – Busca mais rápida
* **flash.nvim** – Navegação rápida estilo EasyMotion
* **spectre.nvim** – Buscar e substituir (arquivo ou projeto)

## Código / Produtividade

* **nvim-lspconfig** – LSP
* **mason.nvim** – Gerenciador de servidores LSP
* **mini.surround** – Adicionar/remover surrounds
* **treesj** – Split/Join estrutural de código
* **nvim-autopairs** – Fechamento automático de pares
* **Comment.nvim** – Comentários rápidos
* **nvim-treesitter** – Parsing e destaque de sintaxe

## Git

* **f-person/git-blame.nvim** – Informações de blame do git
* **gitsigns.nvim** – Sinais de git na gutter (diff, navegação de hunk)

## Markdown

* **markdown-preview.nvim** – Preview em tempo real no navegador

---

# ⌨️ Keymaps (Leader = `Espaço`)

## Básico

| Atalho      | Ação           |
| ----------- | -------------- |
| `Space + w` | Salvar arquivo |
| `Space + q` | Fechar janela  |

---

## Arquivos e Busca

| Atalho       | Ação                                |
| ------------ | ----------------------------------- |
| `Space + e`  | Abrir/fechar explorador de arquivos |
| `Space + ff` | Buscar arquivos (Telescope)         |
| `Space + fg` | Buscar texto no projeto (Live Grep) |

---

## Busca em Modo Visual

| Atalho    | Ação                                 |
| --------- | ----------------------------------- |
| `v + /`  | Buscar texto selecionado no arquivo |
| `v + f`  | Buscar texto selecionado no Telescope |
| `ff`     | Selecionar palavra (modo normal)    |

---

## LSP / Código

| Atalho      | Ação                     |
| ----------- | ------------------------ |
| `gd`        | Ir para definição        |
| `gD`        | Ir para declaração       |
| `gi`        | Ir para implementação    |
| `gr`        | Ver referências          |
| `Space + ca`| Ações de código         |
| `Space + rn`| Renomear símbolo        |
| `Space + =` | Formatar arquivo inteiro |

---

## Navegação entre Janelas

| Atalho     | Ação              |
| ---------- | ----------------- |
| `Ctrl + h` | Janela à esquerda |
| `Ctrl + l` | Janela à direita  |
| `Ctrl + j` | Janela abaixo     |
| `Ctrl + k` | Janela acima      |

---

## Buffers / Abas (Bufferline)

| Atalho       | Ação                      |
| ------------ | ------------------------- |
| `Shift + l`  | Próximo buffer            |
| `Shift + h`  | Buffer anterior           |
| `Space + bp` | Escolher buffer           |
| `Space + bd` | Fechar buffer atual       |
| `Space + bo` | Fechar outros buffers     |
| `Space + br` | Fechar buffers à direita  |
| `Space + bl` | Fechar buffers à esquerda |

---

## Terminal Integrado (ToggleTerm)

| Atalho              | Ação                     |
| ------------------- | ------------------------ |
| `Space + t`         | Abrir terminal flutuante |
| `Esc` (no terminal) | Sair do modo terminal    |
| `Space + tq`        | Terminal 1               |
| `Space + tw`        | Terminal 2               |
| `Space + te`        | Terminal 3               |

---

## Buscar & Substituir (Spectre)

| Atalho       | Ação                  |
| ------------ | --------------------- |
| `Space + sr` | Substituir no arquivo |
| `Space + sR` | Substituir no projeto |

---

## Navegação Rápida (Flash)

| Atalho                 | Ação                              |
| ---------------------- | --------------------------------- |
| `Space + j`            | Pular para texto                  |
| `Space + J`            | Pular por estruturas (Treesitter) |
| `/`                    | Busca interativa com Flash        |
| `Visual + Space + j`   | Flash em seleção                  |
| `Operator + Space + j` | Flash em operadores               |

---

## Surround (mini.surround)

| Atalho | Ação                        |
| ------ | --------------------------- |
| `sa`   | Adicionar surround          |
| `sd`   | Remover surround            |
| `sr`   | Substituir surround         |
| `sf`   | Encontrar surround          |
| `sF`   | Encontrar à esquerda        |
| `sh`   | Destacar surround           |
| `sn`   | Atualizar linhas analisadas |

---

## Split / Join Estrutural (TreesJ)

| Atalho       | Ação              |
| ------------ | ----------------- |
| `Space + sj` | Split estrutural  |
| `Space + sk` | Join estrutural   |
| `Space + st` | Toggle split/join |

---

## Git (gitsigns)

| Atalho       | Ação                   |
| ------------ | ---------------------- |
| `m`          | Próximo hunk           |
| `Shift + m`  | Hunk anterior          |
| `Space + gd` | Diff do arquivo        |

---

## Markdown

| Atalho       | Ação                   |
| ------------ | ---------------------- |
| `Space + mp` | Abrir preview Markdown |
| `Space + ms` | Parar preview          |
| `Space + mt` | Alternar preview       |

---

## AI Assistant (opencode.nvim)

| Atalho             | Ação                               |
| ------------------ | ---------------------------------- |
| `Ctrl + a`         | Perguntar ao opencode              |
| `Ctrl + x`         | Executar ação do opencode          |
| `Ctrl + .`         | Abrir/fechar painel do opencode    |
| `go`               | Adicionar seleção ao opencode      |
| `goo`              | Adicionar linha ao opencode        |
| `Shift + Ctrl + u` | Rolar metade da página para cima   |
| `Shift + Ctrl + d` | Rolar metade da página para baixo  |
| `+`                | Incrementar número                 |
| `-`                | Decrementar número                 |

