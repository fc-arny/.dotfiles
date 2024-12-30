# 👉 Dotfiles

My dotfiles for productive work insipried by https://www.youtube.com/watch?v=y6XCebnB9gs (@dreamsofautonomy)

## Requirements
Ensure you have the following installed on your system
- homebrew
- git 
- stow 


## 📦 Installation
First check out the dotfiles repo in you $HOME directory using git

```bash
$ git clone git@github.com:fc-arny/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

then use GNU stow to create symlinks

```bash
$ stow .
```

```bash
$ curl -sSfL https://raw.githubusercontent.com/fc-arny/dotfiles/master/install | bash
```

When you have it, just use `$ self-update` to sync it with the remote.

## 📰 Articles/Videos
- [Stow has forever changed the way I manage my dotfiles](https://www.youtube.com/watch?v=y6XCebnB9gs)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html).
- [Managing commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification).

## 💻 Environment

- [brew.sh](https://brew.sh)
- [docker](https://www.docker.com)
- [vim](https://www.vim.org)
- [zsh](https://www.zsh.org)

## 📋 TODO
[] Try https://www.youtube.com/watch?v=Z8BL8mdzWHI
