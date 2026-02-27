# lua/plugins AGENTS.md

**Generated:** Thu Feb 26 2026

## OVERVIEW

24 lazy.nvim plugin specs with setup/config functions.

## WHERE TO LOOK

| Plugin | File | Role |
|--------|------|------|
| Telescope | `search.lua` | File/text search |
| LSP | `lsp.lua` | Language server config |
| Mason | `mason.lua` | LSP server manager |
| Treesitter | `treesitter.lua` | Syntax parsing |
| Gitsigns | `git.lua` | Git diff signs |
| Bufferline | `bufferline.lua` | Tab/buffer bar |
| Terminal | `terminal.lua` | Floating terminal |
| DAP | `dap.lua` + `dap-config.lua` | Debugger |

## CONVENTIONS

- Each file returns: single plugin spec OR array of specs
- Config via `config = function()` or `config = true` (uses default)
- Dependencies in `dependencies = { "org/repo", ... }`
- Use `require("plugin_name").setup()` in config blocks
- File naming: descriptive (`search.lua` not `telescope.lua`)

## ANTI-PATTERNS

- Never hardcode plugin URLs (use `org/repo` format)
- No inline setup in plugin spec keys (use config function)
- Avoid `config = true` unless plugin has no required config
- Don't mix multiple unrelated plugins in one file
