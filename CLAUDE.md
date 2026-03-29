# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal dotfiles repo using **GNU stow** for symlink management. Each subdirectory (git/, zsh/, tmux/, vscode/) maps to config files that get symlinked into `$HOME` via `stow .`. The `.stow-local-ignore` file excludes non-config items (bin/, install, Makefile, README, etc.) from stow operations.

## Key Commands

- `make` or `make install` — run the install script
- `stow .` — create/update symlinks from repo subdirectories to $HOME
- `self-update` — pull latest dotfiles and optionally update brew/docker/zsh (`self-update all` or `self-update [apps|brew|docker|dots|zsh]`)
- `make todo` — find all TODO comments in the repo

## Install Script

`install` is a bash script (`set -euo pipefail`) that:
1. Checks for git/curl
2. Installs Homebrew (handles Intel, Apple Silicon, Linux)
3. Runs `stow -t "$HOME"` for tmux, git, zsh directories
4. Symlinks VS Code settings to `~/Library/Application Support/Code/User/`
5. Installs Oh My Zsh if zsh is available

The `backup()` function moves existing configs to `.backup` before symlinking. Several install steps are commented out in the main flow — check the bottom of the file for what's active.

## Conventions

- **Adding a new tool config:** Create a new directory (e.g., `neovim/`), place dotfiles inside mirroring the home directory structure, then add it to the `integrate-cli` function in `install`.
- **Shell utilities** go in `bin/` and are added to PATH via `bin/lib/env.bash`. Bash libraries go in `bin/lib/*.bash` and are auto-sourced by `.zshrc`.
- **Brewfile** is at `toolset/Brewfile` — run `brew bundle --file=toolset/Brewfile` to install packages.
- **Zsh plugins** are managed by Antidote via `.zsh_plugins.txt`.
