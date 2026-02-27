# AGENTS.md

## OVERVIEW

Core Neovim configuration: plugin loading, keymaps, options, commands, LSP, and utilities.

## STRUCTURE

```
lua/core/
├── lazy.lua            # lazy.nvim bootstrap + plugin setup
├── keymaps.lua         # All leader keymaps (save, search, windows, buffers)
├── options.lua         # vim.opt settings (number, clipboard, expandtab, etc.)
├── autocmds.lua        # Autocommands (currently empty)
├── commands.lua        # Custom :CodeVimHelp command
├── lsp.lua             # LSP servers (ts_ls, rust_analyzer, intelephense, cssls, gdscript)
├── git_files.lua       # Git status utilities (open_all, pick, compare via Telescope)
├── session.lua         # Session management
└── search_navigator.lua # Visual search (v+/, v+f, ff)
```

## WHERE TO LOOK

| Task | File |
|------|------|
| Add/change keymap | `keymaps.lua` |
| Edit vim options | `options.lua` |
| Add LSP server | `lsp.lua` |
| Add custom command | `commands.lua` |
| Git status operations | `git_files.lua` |
| Search navigation | `search_navigator.lua` |

## LOAD ORDER

`init.lua` loads: options → keymaps → autocmds → lazy → lsp → commands → search_navigator

## CONVENTIONS

- Leader key is Space (`vim.g.mapleader = " "`)
- Keymaps use `vim.keymap.set` with `desc` option
- LSP uses `vim.lsp.config` (Neovim 0.10+ style)
- Git utilities return module with `open_all`, `pick`, `compare` functions

## ANTI-PATTERNS

- No `vim.api.nvim_set_keymap` (use `vim.keymap.set`)
- No `:map` commands in init (use Lua keymap.set)
- No hardcoded filepaths (use `vim.fn.stdpath`)
