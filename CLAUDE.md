# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS system configuration repository. A single `make setup` bootstraps a new machine end-to-end: installs Homebrew and all apps (via `Brewfile`), symlinks config files into place, and restores saved settings for GUI apps and the system. The goal is a fully reproducible macOS environment from a clean install.

## Common Commands

```bash
make setup    # Full setup: link dotfiles, install deps, restore app settings
make link     # Symlink dotfiles via Dotbot (install.conf.yaml)
make install  # Install Homebrew, Brewfile packages, Neovim (bob), TPM
make backup   # Backup current app settings to settings/
make restore  # Restore app settings from settings/
```

Neovim version is managed by `bob` — currently pinned to 0.11.3 in `make/install.mk`.

## Architecture

**Dotbot** (`install.conf.yaml`) manages symlinking: files under `.config/` and `Brewfile` get linked into `~`. The Makefile and `make/*.mk` files orchestrate installation and settings management.

**Settings backup/restore** (`make/settings.mk`) handles macOS `.plist` files for GUI apps (Karabiner, VS Code, iTerm2, Rectangle, etc.) using `defaults` and `cp` commands.

## Repository Layout

- `.config/` — configs that get symlinked into `~/.config/` or `~/`
  - `.zshrc` — shell config (aliases, env, local overrides via `~/.zshrc.local`)
  - `nvim/` — Neovim config (NvChad framework, Lua)
  - `tmux/` — Tmux config with Catppuccin theme; plugins managed by TPM in `tmux/plugins/`
  - `git/` — `.gitconfig` and `.gitglobal_ignore`
- `settings/` — app-specific plist/JSON configs (not symlinked, managed via make backup/restore)
- `shell/` — standalone shell scripts (e.g. `analyze_perf.sh`)
- `make/` — Makefile includes for install and settings targets
- `Brewfile` — all Homebrew formulae and casks

## Neovim Configuration

**Important:** This config is based on NvChad. When making any modifications, always prefer NvChad-idiomatic patterns — use NvChad's override mechanisms (e.g., `chadrc.lua`, plugin specs in the NvChad style) rather than bypassing or replacing NvChad internals.

Built on **NvChad** (imported as a Lazy plugin). Key entry points:
- `lua/chadrc.lua` — NvChad overrides (theme, UI)
- `lua/mappings.lua` — custom keymaps
- `lua/options.lua` — vim options
- `lua/configs/lazy.lua` — plugin list
- `lua/configs/lspconfig.lua` — LSP server setup

Formatter config lives in `lua/configs/formatter.lua`; uses Stylua for Lua (config: `.stylua.toml`).

## Shell Conventions

`.zshrc` sources `~/.zshrc.local` if it exists — use that file for machine-specific config that should not be committed.

Git aliases defined in both `.zshrc` and `.config/git/.gitconfig`.
