# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**At the start of each session, read `TODO.md` for current tasks and plans.**

## Project Overview

This is a personal dotfiles repository managed with **chezmoi** (https://chezmoi.io). It contains configuration files for a Linux development environment targeting both X11 and Wayland setups.

## Common Commands

```bash
# Apply dotfiles to the system
chezmoi apply

# Preview changes before applying
chezmoi diff

# Add a new file to be managed
chezmoi add ~/.config/example/config

# Edit a managed file (opens in editor, applies on save)
chezmoi edit ~/.zshrc

# Re-run scripts (useful after modifying .chezmoiscripts/)
chezmoi apply --force
```

## Chezmoi Naming Conventions

- `dot_` prefix → becomes `.` (e.g., `dot_zshrc` → `~/.zshrc`)
- `.tmpl` suffix → processed as Go template
- `run_` prefix in `.chezmoiscripts/` → executed during apply
- `run_after_` prefix → executed after file changes

## Architecture

### Templating
Files ending in `.tmpl` use Go template syntax with chezmoi data:
- `{{ .chezmoi.hostname }}` - machine hostname
- `{{ .chezmoi.os }}` - operating system
- `{{ .osid }}` - custom OS identifier (arch, fedora, etc.)

Configuration data is defined in `.chezmoi.toml.tmpl` and prompted on first run.

### External Dependencies
Managed via `.chezmoiexternal.toml`:
- oh-my-zsh and spaceship-prompt (zsh)
- vim-plug (vim/neovim plugin manager)

### Post-Install Scripts
Located in `.chezmoiscripts/`:
- `run_starship.sh` - installs Starship prompt
- `run_after_vimrc.sh` - updates Vim plugins via vim-plug

### Key Configuration Areas
- **Shells**: fish (primary with starship), zsh (with oh-my-zsh)
- **Editors**: Vim and Neovim with vim-plug
- **Window Managers**: Sway and Hyprland (Wayland), i3 (X11)
- **Terminal**: Alacritty with Borg color scheme
- **SSH**: Integrates with 1Password SSH agent
