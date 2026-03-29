# 🟣 Dotfiles

My dotfiles for productive work. Powered by [GNU Stow](https://www.gnu.org/software/stow/) for symlink management.

## 📋 Requirements

- [homebrew](https://brew.sh/)
- [git](https://git-scm.com/)
- [stow](https://www.gnu.org/software/stow/)
- [curl](https://curl.se/)

## 🛠️ Installation

1) Install all necessary dependencies

```bash
curl -sSfL https://raw.githubusercontent.com/fc-arny/.dotfiles/master/install | bash
```

2) Clone the dotfiles repo into your `$HOME` directory

```bash
git clone git@github.com:fc-arny/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

3) Use GNU Stow to create symlinks

```bash
stow .
```

4) Install all Homebrew packages, casks, and Mac App Store apps

```bash
brew bundle --file=toolset/Brewfile
```

## 🔄 Keeping Up to Date

```bash
self-update              # pull latest dotfiles only
self-update all          # update everything: apps, brew, docker, dotfiles, zsh
self-update brew         # update Homebrew packages only
self-update docker       # pull latest Docker images
self-update apps         # update Mac App Store apps
self-update zsh          # update Oh My Zsh
```

## 👤 Git Profiles

Git is configured with two identities using `includeIf`:

| Context | Email | Name |
|---------|-------|------|
| **Default (personal)** | `arthur.shcheglov@gmail.com` | Arthur Shcheglov |
| **Work** (`~/Development/avito/`) | `arshcheglov@avito.ru` | Artur Scheglov |

Any repo cloned under `~/Development/avito/` automatically uses the work profile. Everything else uses the personal profile. Profiles are defined in `git/.gitconfig-personal` and `git/.gitconfig-work`.

## 🧰 How to Use Utilities

### Shell Aliases (`zsh/.aliases.zsh`)

| Alias | Command | Description |
|-------|---------|-------------|
| `cat` | `bat` | Syntax-highlighted file viewer |
| `vim` | `nvim` | Neovim as default editor |
| `rm` | `trash` | Safe delete (moves to Trash instead of permanent removal) |
| `ls` | `ls -al --color` | Colored detailed file listing |
| `gcob` | `git branch \| fzf \| xargs git checkout` | Fuzzy-find and checkout a git branch |
| `yless` | `jless --yaml` | Browse YAML files interactively |
| `cwd` | `pwd \| pbcopy` | Copy current working directory to clipboard |
| `dotfiles` | `cd ~/.dotfiles` | Jump to dotfiles directory |
| `..` / `...` | `cd ../` / `cd ../../` | Quick directory navigation |
| `vimrc` | Open `~/.config/nvim/init.vim` | Edit Neovim config |
| `dots` | `ls .*` | List hidden (dot) files |
| `update-antidote` | Rebundle plugins | Refresh Antidote zsh plugin cache |
| `md5`, `sha1`, `sha256`, `sha512` | `openssl <algo>` | Quick hash computation |

### PATH Utility (`bin/lib/env.bash`)

```bash
path                     # print all PATH entries, one per line
path check               # verify each PATH entry exists on disk
path has /opt/homebrew    # check if a specific path is in PATH
```

### Docker Helpers (`bin/lib/docker.bash`)

```bash
container <name>         # shell into a running container
containers               # list running containers
containers all           # list all containers (including stopped)

images                   # list Docker images (excluding <none>)
images all               # list all images
images clean             # remove dangling images and prune
images pull              # pull latest versions of all images

volume <path>            # mount a volume in an Alpine container for inspection
volumes                  # list named volumes
volumes all              # list all volumes
volumes clean            # remove anonymous (hash-named) volumes

truncate_docker_logs <id>  # clear logs for a container
```

### Git Aliases (`git/.gitconfig`)

**Everyday workflow:**

| Alias | Description |
|-------|-------------|
| `git st` | `status` |
| `git co <branch>` | `checkout` |
| `git br` | `branch` |
| `git ci` | `commit` |
| `git df` | `diff` |
| `git ds` | `diff --staged` |
| `git up` | `pull --rebase --autostash` |
| `git put` | `push origin HEAD` |
| `git pu` | `push --force-with-lease` |
| `git unstage` | `reset HEAD` |

**Log & history:**

| Alias | Description |
|-------|-------------|
| `git lg` | Pretty graph log with colors |
| `git lol` | Oneline graph log |
| `git lola` | Oneline graph log (all branches) |
| `git state` | Show remotes, status, stash, and latest release |

**Commit helpers:**

| Alias | Description |
|-------|-------------|
| `git commend` | Amend last commit (keep message) |
| `git progress <msg>` | Commit with auto-prefixed Jira ticket from branch name |
| `git issue` | Open current branch's Jira ticket in browser |
| `git nah` | Hard reset + clean + deinit submodules (nuclear option) |

**Stash shortcuts:**

| Alias | Description |
|-------|-------------|
| `git stsh` | Stash staged changes only |
| `git stst` | Stash with status |
| `git staash` | Stash including untracked files |
| `git staaash` | Stash everything including ignored files |

### Git Diff with Delta

Diffs are rendered via [delta](https://github.com/dandavies/delta) with side-by-side view, line numbers, and gruvbox-dark theme. This applies automatically to `git diff`, `git log -p`, `git show`, etc.

## 📦 What's Managed

| Directory | Contents |
|-----------|----------|
| `bat/` | bat configuration (theme, syntax mappings) |
| `bin/` | Shell utilities and libraries (added to PATH) |
| `git/` | `.gitconfig`, work/personal profiles, global `.gitignore` |
| `tmux/` | tmux config (Ctrl+A prefix, mouse, 256-color) |
| `toolset/` | Homebrew Brewfile (formulae, casks, Mac App Store apps) |
| `vscode/` | VS Code settings and keybindings |
| `zsh/` | `.zshrc`, aliases, Antidote plugins, Powerlevel10k prompt |

## ➕ Adding a New Package

1. Create a new directory (e.g., `neovim/`) with files mirroring the home directory structure
   - For `~/.config/app/config` → create `app/.config/app/config`
2. Add the directory name to the `packages` array in `./install`
3. Run `stow .` to create the symlinks

## ✨ Articles

Inspired by @dreamsofautonomy.
- [Быстрый старт с Zsh и Powerlevel10k: двигаемся к терминалу мечты](https://habr.com/ru/articles/739376/)
- [Stow has forever changed the way I manage my dotfiles](https://www.youtube.com/watch?v=y6XCebnB9gs)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)
- [Managing commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification)

## 📋 TODO
- Research https://www.youtube.com/watch?v=Z8BL8mdzWHI
- Research https://github.com/sobolevn/dotfiles/tree/master
