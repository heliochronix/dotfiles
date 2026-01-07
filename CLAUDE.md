# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal dotfiles repository managed with **chezmoi** (https://chezmoi.io). It contains configuration files for a Linux development environment targeting Wayland compositors.

**Philosophy**: These dotfiles should work on any system without requiring system-level package installation (except for the shell itself - fish or zsh). All tools and binaries are installed at the user level via chezmoi external dependencies and post-install scripts.

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
- fzf (fuzzy finder)

Rust utilities installed via cargo from crates.io:
- fd-find, bat, ripgrep (installed to ~/.local/bin via run_after_02_build_utils.sh)

### Post-Install Scripts
Located in `.chezmoiscripts/`:
- `run_once_install_rustup.sh` - one-time installation of Rust toolchain
- `run_once_install_fisher.sh` - one-time installation of fisher and initial plugins
- `run_after_01_rustup_update.sh` - updates rustup and Rust toolchains
- `run_after_02_build_utils.sh` - installs/updates Rust utilities from crates.io
- `run_after_fisher_update.sh` - updates fisher and all fish plugins
- `run_starship.sh` - installs/updates Starship prompt
- `run_after_vim_plugins.sh` - updates Vim plugins via vim-plug (depends on .vimrc)
- `run_after_fzf.sh` - installs/updates fzf binary (depends on .fzf external)

Script prefixes:
- `run_once_` - runs only once (tracked by chezmoi state)
- `run_` - runs during file updates (numbered for order: 01, 02)
- `run_after_` - runs after file/external updates (for scripts with dependencies)

### Key Configuration Areas
- **Shells**: fish (primary with plugins managed by fisher), zsh (with oh-my-zsh)
- **Editors**: Vim and Neovim with vim-plug
- **Window Managers**: Sway and Hyprland (Wayland)
- **Terminal**: Alacritty with Borg color scheme
- **SSH**: Integrates with 1Password SSH agent
