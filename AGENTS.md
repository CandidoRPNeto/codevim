# PROJECT KNOWLEDGE BASE

**Generated:** Thu Feb 26 2026
**Commit:** bd0e3b1
**Branch:** main

## OVERVIEW

Neovim configuration (CodeVim) - Lua-based dotfiles with 25+ plugins. Lazy.nvim for plugin management.

## STRUCTURE

```
codevim/
├── init.lua              # Entry point
├── README.md             # Usage manual (English)
├── README.pt.md          # Usage manual (Portuguese)
└── lua/
    ├── core/             # Config, keymaps, autocmds, LSP
    │   ├── lazy.lua      # lazy.nvim bootstrap
    │   ├── keymaps.lua   # All keymaps (leader=Space)
    │   ├── options.lua   # vim.opt settings
    │   ├── autocmds.lua  # Autocommands
    │   ├── commands.lua  # :Commands
    │   ├── lsp.lua       # LSP config
    │   ├── git_files.lua # Git status/compare utilities
    │   ├── session.lua   # Session management
    │   └── search_navigator.lua
    └── plugins/          # 25+ plugin configs
        ├── alpha.lua
        ├── bufferline.lua
        ├── treesitter.lua
        ├── lsp.lua
        ├── mason.lua
        ├── telescope.lua (search.lua)
        ├── terminal.lua
        └── ...
```

## WHERE TO LOOK

| Task | Location | Notes |
|------|----------|-------|
| Add keymap | `lua/core/keymaps.lua` | Leader=Space, use vim.keymap.set |
| Add plugin | `lua/plugins/` | Follow existing pattern: return { { plugin = "..." } } |
| Add command | `lua/core/commands.lua` | vim.api.nvim_create_user_command |
| Edit options | `lua/core/options.lua` | vim.opt settings |
| Git utilities | `lua/core/git_files.lua` | Telescope-based git operations |

## CODE MAP

| Symbol | Type | Location | Role |
|--------|------|----------|------|
| open_all | fn | git_files.lua | Open all git status files |
| pick | fn | git_files.lua | Pick git status files via Telescope |
| compare | fn | git_files.lua | Compare branches |

## CONVENTIONS

- **Plugin config**: Return table with plugin spec, config function
- **Keymaps**: vim.keymap.set with desc option
- **Telescope**: actions + action_state for picker interactions
- **Git commands**: io.popen + git CLI

## ANTI-PATTERNS (THIS PROJECT)

- No @ts-ignore or as any (Lua: no type suppression)
- No empty catch blocks
- No deleting tests to "pass"
- Avoid adding comments that explain what code does

## UNIQUE STYLES

- Leader = Space (not default \)
- Git shortcuts: leader+go (open all), leader+gp (pick), leader+gc (compare branches)
- m / Shift+m: Navigate git hunks (gitsigns)
- Use Telescope for all pickers

## COMMANDS

```bash
# Open Neovim with this config
nvim

# Lazy sync (plugin install/update)
:Lazy
```

## NOTES

- Xclip for clipboard (not pbcopy/wl-copy)
- ToggleTerm for floating terminal
- Spectre for project-wide search/replace
