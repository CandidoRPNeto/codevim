# 🚀 CodeVim

CodeVim is a **Neovim configuration** created to work as a modern, productive, and predictable IDE, inspired by VS Code / JetBrains, but keeping Vim philosophy.

This README serves as a **usage manual**, designed for those who are forgetful (😄), and for anyone who wants to open CodeVim and **know exactly how everything works**.

**Help shortcut**: `Space + h` or `:CodeVimHelp` to open documentation inside Neovim (English). Use `:CodeVimHelp pt` for the Portuguese version.

---

# 📦 Plugins Used

## Interface / UI

* **alpha-nvim** – Startup screen (dashboard)
* **bufferline.nvim** – Tabs/buffers at the top
* **nvim-tree.lua** – File explorer
* **nvim-web-devicons** – Icons
* **nvim-colorizer.lua** – Inline color visualization
* **toggleterm.nvim** – Floating integrated terminal

## Search and Navigation

* **telescope.nvim** – File, text, and symbol search
* **telescope-fzf-native.nvim** – Faster search
* **flash.nvim** – EasyMotion-style quick navigation
* **spectre.nvim** – Search and replace (file or project)

## Code / Productivity

* **nvim-lspconfig** – LSP
* **mason.nvim** – LSP server manager
* **mini.surround** – Add/remove surrounds
* **treesj** – Structural code split/join
* **nvim-autopairs** – Automatic closing of pairs
* **Comment.nvim** – Quick comments
* **nvim-treesitter** – Parsing and syntax highlighting

## Git

* **f-person/git-blame.nvim** – Git blame information
* **gitsigns.nvim** – Git signs in gutter (diff, hunk navigation)

## AI Assistant

* **opencode.nvim** – Open Source Agent

## Markdown

* **markdown-preview.nvim** – Real-time browser preview

---

# ⌨️ Keymaps (Leader = `Space`)

## Basic

| Shortcut     | Action            |
| ------------ | ----------------- |
| `Space + w`  | Save file         |
| `Space + q`  | Close window      |

---

## Files and Search

| Shortcut      | Action                              |
| ------------- | ----------------------------------- |
| `Space + e`   | Toggle file explorer               |
| `Space + ff`  | Search files (Telescope)           |
| `Space + fg`  | Search text in project (Live Grep) |

---

## Visual Mode Search

| Shortcut      | Action                              |
| ------------- | ----------------------------------- |
| `v + /`      | Search selected text in file        |
| `v + f`      | Search selected text with Telescope |
| `ff`         | Select word (normal mode)           |

---

## LSP / Code

| Shortcut       | Action                     |
| -------------- | -------------------------- |
| `gd`           | Go to definition           |
| `gD`           | Go to declaration          |
| `K`            | Show documentation         |
| `gi`           | Go to implementation       |
| `gr`           | Show references            |
| `Space + ca`   | Code actions               |
| `Space + rn`   | Rename symbol              |
| `Space + =`    | Format entire file         |

---

## Autocomplete (nvim-cmp)

| Shortcut       | Action                     |
| -------------- | -------------------------- |
| `Ctrl + Space` | Trigger completion         |
| `Ctrl + b`     | Scroll docs up             |
| `Ctrl + f`     | Scroll docs down           |
| `Ctrl + e`     | Close completion menu      |
| `Enter`        | Confirm selection          |

---

## Treesitter Textobjects (Navigate code structure)

| Shortcut       | Action                          |
| -------------- | ------------------------------- |
| `af`           | Select function (around)        |
| `if`           | Select function (inner)         |
| `ac`           | Select class (around)           |
| `ic`           | Select class (inner)            |
| `Space + fn`   | Next function (start)           |
| `Space + fp`   | Previous function (start)       |
| `Space + fN`   | Next function (end)             |
| `Space + fP`   | Previous function (end)         |
| `Space + cn`   | Next class (start)              |
| `Space + cp`   | Previous class (start)         |
| `Space + cN`   | Next class (end)                |
| `Space + cP`   | Previous class (end)            |

---

## Window Navigation

| Shortcut     | Action          |
| ------------ | --------------- |
| `Ctrl + h`   | Left window     |
| `Ctrl + l`   | Right window    |
| `Ctrl + j`   | Window below    |
| `Ctrl + k`   | Window above    |

---

## Buffers / Tabs (Bufferline)

| Shortcut      | Action                      |
| ------------- | --------------------------- |
| `Shift + l`   | Next buffer                 |
| `Shift + h`   | Previous buffer             |
| `Space + bp`  | Pick buffer                 |
| `Space + bd`  | Close current buffer        |
| `Space + bo`  | Close other buffers         |
| `Space + br`  | Close buffers to the right  |
| `Space + bl`  | Close buffers to the left   |

---

## Integrated Terminal (ToggleTerm)

| Shortcut                | Action                     |
| ----------------------- | -------------------------- |
| `Space + t`             | Open floating terminal     |
| `Esc` (in terminal)     | Exit terminal mode         |
| `Space + tq`            | Terminal 1                 |
| `Space + tw`            | Terminal 2                 |
| `Space + te`            | Terminal 3                 |

---

## Search & Replace (Spectre)

| Shortcut      | Action                 |
| ------------- | ---------------------- |
| `Space + sr`  | Replace in file        |
| `Space + sR`  | Replace in project     |

---

## Quick Navigation (Flash)

| Shortcut               | Action                           |
| ---------------------- | -------------------------------- |
| `Space + j`            | Jump to text                     |
| `Space + J`            | Jump by structures (Treesitter)  |
| `/`                    | Interactive search with Flash    |
| `Visual + Space + j`   | Flash on selection               |
| `Operator + Space + j` | Flash on operators               |

---

## Surround (mini.surround)

| Shortcut | Action                |
| -------- | --------------------- |
| `sa`     | Add surround          |
| `sd`     | Remove surround        |
| `sr`     | Replace surround       |
| `sf`     | Find surround         |
| `sF`     | Find to the left      |
| `sh`     | Highlight surround     |
| `sn`     | Update analyzed lines  |

---

## Structural Split / Join (TreesJ)

| Shortcut      | Action             |
| ------------- | ------------------ |
| `Space + sj`  | Structural split   |
| `Space + sk`  | Structural join    |
| `Space + st`  | Toggle split/join  |

---

## Git (gitsigns)

| Shortcut      | Action              |
| ------------- | ------------------- |
| `m`           | Next hunk           |
| `Shift + m`   | Previous hunk       |
| `Space + gd`  | File diff           |

---

## Markdown

| Shortcut      | Action                    |
| ------------- | ------------------------- |
| `Space + mp`  | Open Markdown preview     |
| `Space + ms`  | Stop preview              |
| `Space + mt`  | Toggle preview            |

---

## AI Assistant (opencode.nvim)

| Shortcut             | Action                              |
| -------------------- | ----------------------------------- |
| `Ctrl + a`           | Ask opencode                        |
| `Ctrl + x`           | Execute opencode action             |
| `Ctrl + .`           | Open/close opencode panel           |
| `go`                 | Add selection to opencode           |
| `goo`                | Add line to opencode                |
| `Shift + Ctrl + u`   | Scroll half page up                 |
| `Shift + Ctrl + d`   | Scroll half page down               |
| `+`                  | Increment number                    |
| `-`                  | Decrement number                    |
